import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/ui/widgets/locale/flags_enum.dart';

class DropButtonLocale extends StatefulWidget {
  final String? tooltip;
  final void Function(String i18n) onChanged;
  final String? initialLocale;
  const DropButtonLocale({
    required this.onChanged,
    Key? key,
    this.tooltip,
    this.initialLocale,
  }) : super(key: key);

  @override
  State<DropButtonLocale> createState() => _DropButtonLocaleState();
}

class _DropButtonLocaleState extends State<DropButtonLocale> {
  final ValueNotifier<FlagsEnum?> currentLocale = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    currentLocale.value = FlagsEnum.values.firstWhere((flag) {
      if (widget.initialLocale != null) return flag.i18n == widget.initialLocale;
      return flag.i18n == Intl.systemLocale;
    }, orElse: () => FlagsEnum.ptBR);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentLocale,
        builder: (context, flag, __) {
          return PopupMenuButton<FlagsEnum>(
            tooltip: widget.tooltip,
            onSelected: (value) {},
            itemBuilder: (context) {
              return FlagsEnum.values
                  .map((contry) => PopupMenuItem<FlagsEnum>(
                        onTap: () {
                          currentLocale.value = contry;
                          widget.onChanged(contry.i18n);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: 0.4.borderRadiusAll,
                              child: SvgPicture.asset(contry.pathFlage, package: "paipfood_package"),
                            ),
                            Sz.s.sizedBoxW,
                            Text(contry.label),
                          ],
                        ),
                      ))
                  .toList();
            },
            surfaceTintColor: context.color.secondaryBG,
            offset: const Offset(0, 30),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(borderRadius: 0.4.borderRadiusAll, child: SvgPicture.asset(currentLocale.value!.pathFlage, package: "paipfood_package")),
                const Icon(Icomoon.arrow_down),
              ],
            ),
          );
        });
  }
}
