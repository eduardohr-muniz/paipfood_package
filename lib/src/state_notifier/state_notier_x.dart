// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:paipfood_package/paipfood_package.dart';

enum SN { load, success, error, init }

class StateNotifierX extends StatelessWidget {
  final ValueNotifier<SN> stateNotifier;
  final Widget? widgetInit;
  final Widget? widgetLoad;
  final Widget? widgetSucess;
  final Widget? widgetError;
  const StateNotifierX({
    Key? key,
    required this.stateNotifier,
    this.widgetInit,
    this.widgetLoad,
    this.widgetSucess,
    this.widgetError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget buildInitWidget = widgetInit ?? const Center(child: Text('Helo'));
    final Widget buildLoadWidget = widgetLoad ?? const Center(child: Text("Loading..."));
    final Widget buildSuccessWidget = widgetSucess ?? const Center(child: Text('Sucess'));
    final Widget buildErrorWidget = widgetError ?? const Center(child: Text('Error'));

    return ValueListenableBuilder<SN>(
      valueListenable: stateNotifier,
      builder: (context, state, _) {
        switch (state) {
          case SN.init:
            Loader.hide();
            return buildInitWidget;
          case SN.load:
            Loader.show(context);
            return buildLoadWidget;
          case SN.success:
            Loader.hide();
            return buildSuccessWidget;
          case SN.error:
            Loader.hide();
            return buildErrorWidget;
        }
      },
    );
  }
}
