// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/src/ui/widgets/buttons/button_secondary_usecase.dart'
    as _i3;
import 'package:example/src/ui/widgets/buttons/button_usecase.dart' as _i2;
import 'package:example/src/ui/widgets/buttons/outline_button_usecase.dart'
    as _i4;
import 'package:example/src/ui/widgets/buttons/text_button_usecase.dart' as _i5;
import 'package:example/src/ui/widgets/dropdowns/drop_button_locale_usecase.dart'
    as _i8;
import 'package:example/src/ui/widgets/empty_state/empty_state_usecase.dart'
    as _i10;
import 'package:example/src/ui/widgets/filds/text_form_fild_usecase.dart'
    as _i6;
import 'package:example/src/ui/widgets/image/cw_image_get_usecase.dart' as _i7;
import 'package:example/src/ui/widgets/switchs/switch_light_dark_usecase.dart'
    as _i9;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'ui',
    children: [
      _i1.WidgetbookFolder(
        name: 'widgets',
        children: [
          _i1.WidgetbookFolder(
            name: 'buttons',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'CwButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i2.cWButtonUsecase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'CwButtonSecondary',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i3.cwButtonSecondaryUsecase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'CwOutlineButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i4.cWOutilineButtonUsecase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'CwTextButton',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i5.cWTextButtonUsecase,
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'filds',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'CwTextFormFild',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i6.cwTextFormFildUseCase,
                ),
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'image',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'CwImageGet',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i7.cWImageGetUsecase,
                ),
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'locale',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'DropButtonLocale',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i8.dropButtonLocaleUsecase,
                ),
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'switchs',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'CwSwitchLightDark',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i9.cwSwitchLightDarkUsecase,
                ),
              )
            ],
          ),
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'Container',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i10.cWEmptyStateUsecase,
        ),
      )
    ],
  ),
];
