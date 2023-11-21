import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

import 'package:paipfood_package/src/ui/widgets/locale/drop_locale_phone/countries.dart';
import 'package:paipfood_package/src/ui/widgets/locale/drop_locale_phone/helpers.dart';

class FlagCountrySelector extends StatefulWidget {
  final List<Country>? countries;
  final String? initialCountryCode;
  final String languageCode;
  final String searchText;
  final double maxheight;
  final ValueChanged<Country>? onCountryChanged;
  final bool enabled;
  const FlagCountrySelector({
    Key? key,
    this.countries,
    this.initialCountryCode = 'BR',
    this.languageCode = 'pt_BR',
    this.searchText = '',
    this.onCountryChanged,
    this.enabled = true,
    this.maxheight = 250,
  }) : super(key: key);

  @override
  State<FlagCountrySelector> createState() => _FlagCountrySelectorState();
}

class _FlagCountrySelectorState extends State<FlagCountrySelector> {
  late List<Country> _countryList;
  late Country _selectedCountry;
  late List<Country> filteredCountries;
  late String number;
  final menuController = MenuController();

  String? validatorMessage;

  @override
  void initState() {
    super.initState();
    _countryList = widget.countries ?? countries;
    filteredCountries = _countryList;
    number = '';
    if (widget.initialCountryCode == null && number.startsWith('+')) {
      number = number.substring(1);
      // parse initial value
      _selectedCountry = countries.firstWhere((country) => number.startsWith(country.fullCountryCode), orElse: () => _countryList.first);

      // remove country code from the initial number value
      number = number.replaceFirst(RegExp("^${_selectedCountry.fullCountryCode}"), "");
    } else {
      _selectedCountry = _countryList.firstWhere((item) => item.code == (widget.initialCountryCode ?? 'US'), orElse: () => _countryList.first);

      // remove country code from the initial number value
      if (number.startsWith('+')) {
        number = number.replaceFirst(RegExp("^\\+${_selectedCountry.fullCountryCode}"), "");
      } else {
        number = number.replaceFirst(RegExp("^${_selectedCountry.fullCountryCode}"), "");
      }
    }
    filteredCountries.toList().sort(
          (a, b) => a.localizedName(widget.languageCode).compareTo(b.localizedName(widget.languageCode)),
        );
  }

  Future<void> _changeCountry() async {
    filteredCountries = _countryList;
    menuController.open();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: menuController,
      style: MenuStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(context.color.primaryBG),
          surfaceTintColor: MaterialStatePropertyAll<Color>(context.color.primaryBG)),
      menuChildren: [
        SizedBox(
          height: max(min(filteredCountries.length * 70 + 50, widget.maxheight), 100),
          width: 125,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CwTextFormFild(
                  autofocus: true,
                  suffixIcon: const Icon(Icomoon.search_normal),
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        filteredCountries = _countryList.stringSearch(value)
                          ..sort(
                            (a, b) => a.localizedName(widget.languageCode).compareTo(b.localizedName(widget.languageCode)),
                          );
                      });
                    }
                  },
                ),
              ),
              Expanded(
                child: Builder(builder: (context) {
                  final length = filteredCountries.length;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          leading: Image.asset(
                            'assets/flags/${filteredCountries[index].code.toUpperCase()}.png',
                            package: 'paipfood_package',
                            width: 32,
                          ),
                          trailing: Text('+${filteredCountries[index].dialCode}'),
                          onTap: () {
                            setState(() {
                              _selectedCountry = filteredCountries[index];
                              widget.onCountryChanged?.call(_selectedCountry);
                            });
                            menuController.close();
                          },
                        );
                      });
                }),
              ),
            ],
          ),
        ),
      ],
      child: SizedBox(
        child: InkWell(
          onTap: widget.enabled ? _changeCountry : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // kIsWeb
              //     ?
              Image.asset(
                'assets/flags/${_selectedCountry.code.toUpperCase()}.png',
                package: 'paipfood_package',
                width: 32,
              ),
              // : Text(
              //     _selectedCountry.flag,
              //     style: const TextStyle(fontSize: 18),
              //   ),

              0.5.sizedBoxW,
              FittedBox(
                child: Text(
                  '+${_selectedCountry.dialCode}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
