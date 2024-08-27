import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// A class that represents a loading widget
/// 
class LoadingWidget extends StatelessWidget {

  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.horizontalRotatingDots(
        color: Theme.of(context).primaryColor,
        size: 30
      )
    );
  }
}