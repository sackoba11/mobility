/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class Assets {
  Assets._();

  static const AssetGenImage dots = AssetGenImage('assets/Dots.png');
  static const AssetGenImage google = AssetGenImage('assets/Google.png');
  static const SvgGenImage googoleIcon = SvgGenImage('assets/Googole icon.svg');
  static const AssetGenImage icon = AssetGenImage('assets/Icon.png');
  static const AssetGenImage map = AssetGenImage('assets/Map.png');
  static const AssetGenImage map1 = AssetGenImage('assets/Map1.png');
  static const AssetGenImage map2 = AssetGenImage('assets/Map2.png');
  static const AssetGenImage map3 = AssetGenImage('assets/Map3.png');
  static const AssetGenImage oval = AssetGenImage('assets/Oval.png');
  static const AssetGenImage oval1 = AssetGenImage('assets/Oval1.png');
  static const AssetGenImage rectangle = AssetGenImage('assets/Rectangle.png');
  static const AssetGenImage rectangle1 =
      AssetGenImage('assets/Rectangle1.png');
  static const AssetGenImage vector1 = AssetGenImage('assets/Vector1.png');
  static const AssetGenImage vector2 = AssetGenImage('assets/Vector2.png');
  static const SvgGenImage vector2s = SvgGenImage('assets/Vector2s.svg');
  static const AssetGenImage vector3 = AssetGenImage('assets/Vector3.png');
  static const AssetGenImage vector4 = AssetGenImage('assets/Vector4.png');
  static const SvgGenImage bus = SvgGenImage('assets/bus.svg');
  static const AssetGenImage bustop = AssetGenImage('assets/bustop.png');
  static const SvgGenImage current = SvgGenImage('assets/current.svg');
  static const SvgGenImage driver = SvgGenImage('assets/driver.svg');
  static const AssetGenImage gbaka = AssetGenImage('assets/gbaka.png');
  static const AssetGenImage location = AssetGenImage('assets/location.png');
  static const SvgGenImage next = SvgGenImage('assets/next.svg');
  static const SvgGenImage passenger = SvgGenImage('assets/passenger.svg');
  static const SvgGenImage road = SvgGenImage('assets/road.svg');
  static const AssetGenImage robot = AssetGenImage('assets/robot.png');
  static const AssetGenImage stop = AssetGenImage('assets/stop.png');
  static const AssetGenImage stopBlack = AssetGenImage('assets/stopBlack.png');
  static const AssetGenImage stopDest = AssetGenImage('assets/stopDest.png');
  static const AssetGenImage stopRed = AssetGenImage('assets/stopRed.png');
  static const AssetGenImage stopStart = AssetGenImage('assets/stopStart.png');

  /// List of all assets
  List<dynamic> get values => [
        dots,
        google,
        googoleIcon,
        icon,
        map,
        map1,
        map2,
        map3,
        oval,
        oval1,
        rectangle,
        rectangle1,
        vector1,
        vector2,
        vector2s,
        vector3,
        vector4,
        bus,
        bustop,
        current,
        driver,
        gbaka,
        location,
        next,
        passenger,
        road,
        robot,
        stop,
        stopBlack,
        stopDest,
        stopRed,
        stopStart
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
