import 'dart:async';

import 'package:example/modules/presenter/overlay_test.dart';
import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwToast extends StatefulWidget {
  final String alertTitle;
  final String alertMessage;
  final AlertType alertType;
  final int seconds;

  const CwToast({
    Key? key,
    required this.alertTitle,
    required this.alertMessage,
    required this.alertType,
    this.seconds = 10,
  }) : super(key: key);

  @override
  State<CwToast> createState() => _CwToastState();
}

double progress = 0.0;

class _CwToastState extends State<CwToast> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {});
    Map<AlertType, Color> typeBoxColor = {
      AlertType.danger: const Color(0xFFC72C41),
      AlertType.error: const Color(0xFFF64B3C),
      AlertType.warning: const Color(0xFFEF8D32),
      AlertType.detail: const Color(0xFF4E8D7C),
      AlertType.info: const Color(0xFF3282B8),
      AlertType.success: const Color(0xFF0C7040),
      AlertType.primary: const Color(0xFF0070E0)
    };

    Map<AlertType, Color> typeIconColor = {
      AlertType.danger: const Color(0xFF801336),
      AlertType.error: const Color(0xFFC81912),
      AlertType.warning: const Color(0xFFCC561E),
      AlertType.detail: const Color(0xFF3E7063),
      AlertType.info: const Color(0xFF0F4C75),
      AlertType.success: const Color(0xFF004E32),
      AlertType.primary: const Color(0xFF05478A)
    };
    var textTheme = context.textTheme.bodyMedium;

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 90,
              decoration: BoxDecoration(
                color: typeBoxColor[widget.alertType],
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.alertTitle,
                        style: textTheme!.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        widget.alertMessage,
                        style: textTheme.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/bubbles.svg",
                      height: 48,
                      width: 40,
                      colorFilter: ColorFilter.mode(typeIconColor[widget.alertType]!, BlendMode.srcIn),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -20,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/fail.svg",
                      colorFilter: ColorFilter.mode(typeIconColor[widget.alertType]!, BlendMode.srcIn),
                      height: 40,
                    ),
                    Positioned(
                      top: 10,
                      child: SvgPicture.asset(
                        "assets/close.svg",
                        height: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: Stream.periodic(const Duration(milliseconds: 100)),
              builder: (context, snapshot) {
                double increment = widget.seconds / 100;
                var value = progress += increment;
                if (value < 1) {
                  progress = value;
                } else {
                  progress = 1.0;
                  CwOverlay.hide();
                  progress = 0.0;
                }
                return LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.yellow,
                  color: Colors.blue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum AlertType { error, warning, success, info, primary, danger, detail }
