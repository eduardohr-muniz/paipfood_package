import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwSearchAddress extends StatefulWidget {
  final GeoapifyRepository geoapifyRepo;
  final TextEditingController? neighborhoodEC;
  final Function(AddressModel address) onTap;
  final String? initialValue;
  const CwSearchAddress({
    required this.geoapifyRepo,
    required this.onTap,
    Key? key,
    this.neighborhoodEC,
    this.initialValue = "",
  }) : super(key: key);

  @override
  State<CwSearchAddress> createState() => _CwSearchAddressState();
}

class _CwSearchAddressState extends State<CwSearchAddress> {
  ValueNotifier<List<AddressModel>> listAddress = ValueNotifier([]);
  final menuController = MenuController();
  late final addressEC = TextEditingController(text: widget.initialValue);
  final debounce = Debounce();

  searchAddress(String value) async {
    final List<AddressModel> result = await widget.geoapifyRepo.autoComplete(value);
    listAddress.value = result;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: listAddress,
        builder: (context, values, __) {
          return CwSearchFild(
            maskUtils: MaskUtils.cRequired(),
            menuController: menuController,
            hintText: "Rua, bairro, cidade",
            label: "Endereço do Estabelecimento",
            list: values,
            controller: addressEC,
            children: values
                .map((address) => ListTile(
                      onTap: () {
                        address = address.copyWith(
                          complement: address.complement,
                          number: address.number,
                        );

                        addressEC.text = address.address;
                        widget.neighborhoodEC?.text = address.neighborhood;
                        menuController.close();
                        widget.onTap(address);
                      },
                      tileColor: context.color.onPrimaryBG,
                      hoverColor: context.color.secondaryText,
                      focusColor: context.color.secondaryText,
                      leading: CircleAvatar(
                          backgroundColor: context.color.secondaryColor,
                          radius: 18,
                          child: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          )),
                      title: SizedBox(
                        height: context.responsive.isMobile ? 30 : null,
                        child: Text(
                          address.address,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              debounce.startTimer(
                  value: value,
                  onTap: () {
                    searchAddress(value);
                  },
                  lenght: 3);
            },
          );
        });
  }
}
