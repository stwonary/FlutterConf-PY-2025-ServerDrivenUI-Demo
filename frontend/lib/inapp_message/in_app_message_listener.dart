import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/inapp_message/in_app_message_cubit.dart';
import 'package:mirai/mirai.dart';

class InAppMessagingListener extends StatelessWidget {
  const InAppMessagingListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InAppMessageCubit, InAppMessageState>(
      listener: (context, state) {
        if (state is BottomSheetState) {
          _showBottomSheet(context, state);
        } else if (state is DialogState) {
          _showDialog(context, state);
        }
      },
      child: child,
    );
  }

  void _showBottomSheet(BuildContext context, BottomSheetState config) {
    showModalBottomSheet(
      context: context,
      backgroundColor: config.backgroundColor,
      shape: config.shape,
      clipBehavior: config.clipBehavior,
      elevation: config.elevation,
      enableDrag: config.enableDrag,
      barrierColor: config.modalBarrierColor,
      isDismissible: config.isDismissible,
      isScrollControlled: config.isScrollControlled,
      useRootNavigator: true, // to show the bottom sheet on top of the whole ui
      builder: (context) => Mirai.fromJson(
        config.body as Map<String, dynamic>?,
        context,
      )!,
    );
  }

  void _showDialog(BuildContext context, DialogState config) {
    showDialog(
      context: context,
      barrierLabel: config.barrierLabel,
      barrierColor: config.barrierColor,
      barrierDismissible: config.barrierDismissible,
      useRootNavigator: config.useRootNavigator,
      useSafeArea: config.useSafeArea,
      builder: (context) => Dialog(
        shape: config.shape,
        elevation: config.elevation,
        backgroundColor: config.backgroundColor,
        clipBehavior: config.clipBehavior,
        insetPadding: config.insetPadding,
        insetAnimationDuration: config.insetAnimationDuration,
        child: Mirai.fromJson(
          config.body as Map<String, dynamic>?,
          context,
        )!,
      ),
    );
  }
}
