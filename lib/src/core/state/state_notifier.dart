import 'package:flutter/material.dart';
import 'package:paipfood_package/src/ui/overlay_loader.dart';

enum Status {
  load,
  complete,
  error,
  initial,
  empty;
}

class StateNotifier extends StatelessWidget {
  final bool overlay;
  final ValueNotifier<Status> stateNotifier;
  final Widget Function(BuildContext context)? onInitial;
  final Widget Function(BuildContext context)? onLoad;
  final Widget Function(BuildContext context)? onSucess;
  final Widget Function(BuildContext context)? onError;
  final Widget Function(BuildContext context)? onEmpty;

  const StateNotifier({
    required this.stateNotifier,
    Key? key,
    this.overlay = true,
    this.onInitial,
    this.onLoad,
    this.onSucess,
    this.onError,
    this.onEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Status>(
      valueListenable: stateNotifier,
      builder: (context, state, _) {
        switch (state) {
          case Status.initial:
            if (overlay) Loader.hide();
            return onInitial != null ? onInitial!(context) : const Center(child: Text('Helo'));
          case Status.load:
            if (overlay) Loader.show(context);
            return onLoad != null ? onLoad!(context) : const Center(child: Text("Loading..."));
          case Status.complete:
            if (overlay) Loader.hide();
            return onSucess != null ? onSucess!(context) : const Center(child: Text('Sucess'));
          case Status.empty:
            if (overlay) Loader.hide();
            return onEmpty != null ? onEmpty!(context) : const Center(child: Text('Empty'));
          case Status.error:
            if (overlay) Loader.hide();
            return onError != null ? onError!(context) : const Center(child: Text('Error'));
        }
      },
    );
  }
}
