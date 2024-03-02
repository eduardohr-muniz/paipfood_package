import 'dart:async';

import 'package:paipfood_package/paipfood_package.dart';

class PrinterRepository implements IPrinterRepository {
  final ILocalStorage localStorage;
  PrinterRepository({required this.localStorage});
  @override
  Future<void> connectPrinter(
      {required PrinterManager printerManager, required PrinterModel printer, PrinterType printerType = PrinterType.usb}) async {
    await printerManager.disconnect(type: printerType);
    await Future.delayed(100.ms);
    await printerManager.connect(
        type: printerType, model: UsbPrinterInput(name: printer.name, productId: printer.productId, vendorId: printer.vendorId));
  }

  @override
  Future<void> desconnectPrinter({required PrinterManager printerManager, required PrinterType printerType}) async {
    await printerManager.disconnect(type: printerType);
  }

  @override
  Future<List<PrinterModel>> getPrinters(
      {required PrinterManager printerManager,
      PrinterType printerType = PrinterType.usb,
      isBluethoot = false,
      String ipAddress = "",
      int port = 9100}) async {
    final List<PrinterModel> printers = [];
    StreamSubscription<PrinterDevice> subscription;
    subscription = printerManager.discovery(type: printerType, isBle: isBluethoot, model: TcpPrinterInput(ipAddress: ipAddress, port: port)).listen(
      (device) {
        printers.add(
          PrinterModel(
            printerType: printerType,
            name: device.name.toString(),
            productId: device.productId,
            vendorId: device.vendorId,
            operatingSystem: device.operatingSystem,
          ),
        );
      },
    );
    await subscription.asFuture();
    await subscription.cancel();
    return printers;
  }

  @override
  Future<PrinterModel?> getPrinterById(String id) async {
    final req = await localStorage.get(PrinterModel.box, key: id);
    if (req != null) return PrinterModel.fromMap(req);
    return null;
  }

  @override
  Future<void> savePrinter({required PrinterModel printer, required String id}) async {
    await localStorage.put(PrinterModel.box, key: id, value: printer.toMap());
  }

  @override
  Future<void> deletePrinter(String id) async {
    await localStorage.delete(PrinterModel.box, keys: [id]);
  }

  @override
  Future<void> sendPrint({required PrinterManager printerManager, required PrinterModel printer, required List<int> bytes, int qty = 1}) async {
    await printerManager.connect(
        type: printer.printerType, model: UsbPrinterInput(name: printer.name, productId: printer.productId, vendorId: printer.vendorId));
    for (var i = 0; i < qty; i++) {
      await printerManager.send(type: printer.printerType, bytes: bytes);
    }
  }
}
