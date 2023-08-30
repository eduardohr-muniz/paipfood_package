// ignore_for_file: unused_import

library paipfood_package;

export 'package:paipfood_dependencies/paipfood_dependencies.dart';
// dependencies
import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'src/core/interfaces/local_storage/i_local_storage.dart';
import 'src/core/interfaces/messages/i_messages.dart';
import 'src/core/log/conf_log.dart';
import 'src/ui/overlay_loader.dart';

//? CONTROLLERS
part './src/core/controllers/debounce.dart';
//?? EXTENIONS
part 'src/extensions/context_extension.dart';
part 'src/ui/shadowns.dart';
part 'src/extensions/mask_input_extension.dart';
part 'src/core/interfaces/messages/messages.dart';
part 'src/extensions/color_extension.dart';
part 'src/extensions/theme_extension.dart';
part 'src/core/log/log.dart';
part 'src/core/interfaces/local_storage/local_storage.dart';
// //?? UI
part 'src/ui/widgets/cw_search_fild.dart';
part 'src/ui/widgets/cw_sized_box.dart';
part 'src/ui/widgets/cw_text_form_fild.dart';
part 'src/ui/widgets/cw_elevated_button.dart';
//?? State
//? Exceptions
part 'src/core/exceptions/try_functions.dart';
