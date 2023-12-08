import 'package:flutter/material.dart';
import 'package:paipfood_package/src/ui/overlay_loader.dart';

class FutureState<T> extends StatelessWidget {
  final Future<T> future;
  final T? initialData;
  final Widget Function(BuildContext context, Object? error)? onError;
  final Widget Function(BuildContext context)? onLoading;
  final Widget Function(BuildContext context, T data) onComplete;
  final Function(BuildContext context)? onEmpty;
  const FutureState({
    required this.future,
    required this.onComplete,
    Key? key,
    this.initialData,
    this.onError,
    this.onLoading,
    this.onEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      initialData: initialData,
      builder: (context, snapshot) {
        final status = snapshot.connectionState;

        if (snapshot.hasError) {
          if (onLoading == null) Loader.hide();
          if (onError != null) {
            return onError!(context, snapshot.error);
          }
        }

        if (status == ConnectionState.waiting) {
          if (onLoading != null) {
            return onLoading!(context);
          } else {
            Loader.show(context);
          }
        }

        if (status == ConnectionState.done) {
          if (onLoading == null) Loader.hide();
          if (snapshot.hasData && snapshot.data.toString() != "[]") {
            return onComplete(context, snapshot.data as T);
          }
          if (onEmpty != null) {
            return onEmpty!(context);
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}
