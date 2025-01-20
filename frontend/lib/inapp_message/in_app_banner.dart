import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/inapp_message/in_app_message_cubit.dart';
import 'package:mirai/mirai.dart';

class InAppBanner extends StatefulWidget {
  const InAppBanner({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  State<InAppBanner> createState() => _InAppBannerState();
}

class _InAppBannerState extends State<InAppBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    const duration = Duration(milliseconds: 200);
    _animation = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InAppMessageCubit, InAppMessageState>(
      builder: (context, state) {
        if (state is BannerState && state.tag == widget.tag) {
          final widget = _build(context, state);
          _animation.forward(); // start only after widget built successfully
          return widget;
        }
        return const SizedBox();
      },
    );
  }

  Widget _build(BuildContext context, BannerState state) {
    final body = state.body as Map<String, dynamic>?;
    final child = Mirai.fromJson(body, context) ?? const SizedBox();
    return SizeTransition(
      sizeFactor: _animation,
      child: state.dismissible == true
          ? Dismissible(
              key: UniqueKey(),
              onDismissed: (_) => _onDismissed(),
              child: child,
            )
          : child,
    );
  }

  Future<void> _onDismissed() async {
    await _animation.reverse();
  }
}
