import 'package:paipfood_package/paipfood_package.dart';

abstract interface class IPrinterRepository {
  Future<List<PrinterModel>> getPrinters({required PrinterManager printerManager, PrinterType printerType = PrinterType.usb, isBluethoot = false});
  Future<void> connectPrinter({required PrinterManager printerManager, required PrinterModel printer, PrinterType printerType = PrinterType.usb});
  Future<void> desconnectPrinter({required PrinterManager printerManager, required PrinterType printerType});
  Future<void> savePrinter({required PrinterModel printer, required String id});
  Future<void> deletePrinter(String id);
  Future<PrinterModel?> getPrinterById(String id);
  Future<void> sendPrint({required PrinterManager printerManager, required PrinterModel printer, required List<int> bytes, int qty = 1});
}
