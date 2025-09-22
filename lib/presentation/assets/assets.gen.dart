// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/onboard.png
  AssetGenImage get onboard => const AssetGenImage('assets/images/onboard.png');

  /// File path: assets/images/profile_image_placeholder.png
  AssetGenImage get profileImagePlaceholder =>
      const AssetGenImage('assets/images/profile_image_placeholder.png');

  /// List of all assets
  List<AssetGenImage> get values => [onboard, profileImagePlaceholder];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/android.png
  AssetGenImage get android => const AssetGenImage('assets/logo/android.png');

  /// File path: assets/logo/ios.png
  AssetGenImage get ios => const AssetGenImage('assets/logo/ios.png');

  /// File path: assets/logo/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/logo/splash.png');

  /// File path: assets/logo/splash_12.png
  AssetGenImage get splash12 =>
      const AssetGenImage('assets/logo/splash_12.png');

  /// List of all assets
  List<AssetGenImage> get values => [android, ios, splash, splash12];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/apartment.svg
  SvgGenImage get apartment => const SvgGenImage('assets/svgs/apartment.svg');

  /// File path: assets/svgs/dark_mode.svg
  SvgGenImage get darkMode => const SvgGenImage('assets/svgs/dark_mode.svg');

  /// File path: assets/svgs/diamond.svg
  SvgGenImage get diamond => const SvgGenImage('assets/svgs/diamond.svg');

  /// File path: assets/svgs/land.svg
  SvgGenImage get land => const SvgGenImage('assets/svgs/land.svg');

  /// File path: assets/svgs/language.svg
  SvgGenImage get language => const SvgGenImage('assets/svgs/language.svg');

  /// File path: assets/svgs/light_mode.svg
  SvgGenImage get lightMode => const SvgGenImage('assets/svgs/light_mode.svg');

  /// File path: assets/svgs/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/svgs/logo.svg');

  /// File path: assets/svgs/mark_email_read.svg
  SvgGenImage get markEmailRead =>
      const SvgGenImage('assets/svgs/mark_email_read.svg');

  /// File path: assets/svgs/notification_settings.svg
  SvgGenImage get notificationSettings =>
      const SvgGenImage('assets/svgs/notification_settings.svg');

  /// File path: assets/svgs/office.svg
  SvgGenImage get office => const SvgGenImage('assets/svgs/office.svg');

  /// File path: assets/svgs/policy.svg
  SvgGenImage get policy => const SvgGenImage('assets/svgs/policy.svg');

  /// File path: assets/svgs/shop.svg
  SvgGenImage get shop => const SvgGenImage('assets/svgs/shop.svg');

  /// File path: assets/svgs/telegram.svg
  SvgGenImage get telegram => const SvgGenImage('assets/svgs/telegram.svg');

  /// File path: assets/svgs/theme_contrast.svg
  SvgGenImage get themeContrast =>
      const SvgGenImage('assets/svgs/theme_contrast.svg');

  /// File path: assets/svgs/whatsapp_logo.svg
  SvgGenImage get whatsappLogo =>
      const SvgGenImage('assets/svgs/whatsapp_logo.svg');

  /// File path: assets/svgs/whatsapp_logo_2.svg
  SvgGenImage get whatsappLogo2 =>
      const SvgGenImage('assets/svgs/whatsapp_logo_2.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    apartment,
    darkMode,
    diamond,
    land,
    language,
    lightMode,
    logo,
    markEmailRead,
    notificationSettings,
    office,
    policy,
    shop,
    telegram,
    themeContrast,
    whatsappLogo,
    whatsappLogo2,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
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
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
