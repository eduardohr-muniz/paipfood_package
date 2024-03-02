import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwSearchAddress extends StatefulWidget {
  final GeoapifyRepository geoapifyRepo;
  final TextEditingController? neighborhoodEC;

  final Function(AddressModel address) onSelectAddress;
  final String? initialValue;
  final String? label;
  final String? hintText;

  final double? maxheight;
  const CwSearchAddress({
    required this.geoapifyRepo,
    required this.onSelectAddress,
    Key? key,
    this.neighborhoodEC,
    this.initialValue = "",
    this.label,
    this.hintText,
    this.maxheight,
  }) : super(key: key);

  @override
  State<CwSearchAddress> createState() => _CwSearchAddressState();
}

class _CwSearchAddressState extends State<CwSearchAddress> {
  final SearchController controller = SearchController();

  Future<List<Widget>> searchAddress(String value) async {
    if (value.isEmpty) return [];
    final List<AddressModel> result = await widget.geoapifyRepo.autoComplete(value);
    return result
        .map((address) => ListTile(
              visualDensity: VisualDensity.standard,
              onTap: () {
                address = address.copyWith(
                  complement: address.complement,
                  number: address.number,
                );

                widget.neighborhoodEC?.text = address.neighborhood;
                widget.onSelectAddress(address);
                controller.closeView(address.addressToFild);
              },
              tileColor: context.color.onPrimaryBG,
              // hoverColor: context.color.secondaryText,
              // focusColor: context.color.secondaryText,
              leading: CircleAvatar(
                  backgroundColor: Colors.blue.withOpacity(0.2),
                  radius: 18,
                  child: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue,
                  )),
              title: SizedBox(
                child: Text(
                  address.address,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ))
        .toList();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CwSearchFild(
      maxheight: widget.maxheight,
      debounceMilisecons: 450,
      searchOnTap: false,
      hintText: "Pesquise: Rua, Bairro, Cidade",
      label: widget.label ?? "Endereço do Estabelecimento",
      searchController: controller,
      onChanged: (value) async {
        return await searchAddress(value);
      },
    );
  }
}
