part of 'in_app_message_cubit.dart';

@immutable
sealed class InAppMessageState {}

class InitialState extends InAppMessageState {}

class BottomSheetState extends InAppMessageState {
  BottomSheetState(Map map)
      : body = nonNull(map['body']),
        elevation = map['elevation']?.toDouble(),
        modalBarrierColor = parseHexColor(map['modalBarrierColor']),
        backgroundColor = parseHexColor(map['backgroundColor']),
        shape = parseShape(map['shape']),
        clipBehavior =
            parseEnum(Clip.values, map['clipBehavior']) ?? Clip.antiAlias,
        isScrollControlled = map['isScrollControlled'] ?? true,
        isDismissible = map['isDismissible'] ?? true,
        enableDrag = map['enableDrag'] ?? true;

  final Map body;
  final double? elevation;
  final Color? modalBarrierColor;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  final Clip clipBehavior;
  final bool isScrollControlled;
  final bool isDismissible;
  final bool enableDrag;
}

class DialogState extends InAppMessageState {
  DialogState(Map map)
      : body = nonNull(map['body']),
        barrierLabel = map['barrierLabel'],
        barrierColor = parseHexColor(map['barrierColor']) ?? Colors.black54,
        barrierDismissible = map['barrierDismissible'] ?? true,
        useRootNavigator = map['useRootNavigator'] ?? true,
        useSafeArea = map['useSafeArea'] ?? true,
        elevation = map['elevation']?.toDouble(),
        clipBehavior = parseEnum(Clip.values, map['clipBehavior']) ?? Clip.none,
        backgroundColor = parseHexColor(map['backgroundColor']),
        insetAnimationDuration =
            parseDuration(map['insetAnimationDuration']) ?? duration,
        insetPadding =
            parseEdgeInsetsGeometry(map['insetPadding']) as EdgeInsets? ??
                padding,
        shape = parseShape(map['shape']);

  static const padding = EdgeInsets.symmetric(horizontal: 40, vertical: 24);
  static const duration = Duration(milliseconds: 100);

  final Map body;
  final String? barrierLabel;
  final Color barrierColor;
  final bool barrierDismissible;
  final bool useRootNavigator;
  final bool useSafeArea;
  final double? elevation;
  final Clip clipBehavior;
  final Color? backgroundColor;
  final Duration insetAnimationDuration;
  final EdgeInsets insetPadding;
  final ShapeBorder? shape;
}

class BannerState extends InAppMessageState {
  BannerState(Map map)
      : tag = nonNull(map['tag']),
        body = nonNull(map['body']),
        dismissible = map['dismissible'] ?? true;

  final String tag;
  final Map body;
  final bool dismissible;
}