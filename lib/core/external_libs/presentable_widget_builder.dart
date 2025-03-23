import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A widget that connects a Presenter to a UI widget, handling dependency injection,
/// updates, and disposal
class PresentableWidgetBuilder<T extends DisposableInterface> extends StatefulWidget {
  /// Factory function to create or retrieve the presenter
  final T Function() presenter;
  
  /// Builder function to create the widget using the presenter and its state
  final Widget Function(T presenter) builder;
  
  /// Whether to handle disposal of the presenter when this widget is disposed
  final bool handleDisposal;

  const PresentableWidgetBuilder({
    super.key,
    required this.presenter,
    required this.builder,
    this.handleDisposal = true,
  });

  @override
  State<PresentableWidgetBuilder<T>> createState() => _PresentableWidgetBuilderState<T>();
}

class _PresentableWidgetBuilderState<T extends DisposableInterface> extends State<PresentableWidgetBuilder<T>> {
  late T _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = widget.presenter();
  }

  @override
  void dispose() {
    if (widget.handleDisposal) {
      Get.delete<T>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_presenter);
  }
}

/// Utility function to load a presenter
T loadPresenter<T extends DisposableInterface>(T presenter) {
  return Get.put<T>(presenter);
}

/// Utility function to manually unload a presenter
void unloadPresenterManually<T extends DisposableInterface>() {
  Get.delete<T>();
} 