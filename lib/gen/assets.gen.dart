/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_facebook.png
  AssetGenImage get icFacebook =>
      const AssetGenImage('assets/images/ic_facebook.png');

  /// File path: assets/images/ic_filter.svg
  String get icFilter => 'assets/images/ic_filter.svg';

  /// File path: assets/images/ic_google.png
  AssetGenImage get icGoogle =>
      const AssetGenImage('assets/images/ic_google.png');

  /// File path: assets/images/ic_notification.svg
  String get icNotification => 'assets/images/ic_notification.svg';

  /// File path: assets/images/ic_search.svg
  String get icSearch => 'assets/images/ic_search.svg';

  /// File path: assets/images/img_bg_app.svg
  String get imgBgApp => 'assets/images/img_bg_app.svg';

  /// File path: assets/images/img_bg_app_2.svg
  String get imgBgApp2 => 'assets/images/img_bg_app_2.svg';

  /// File path: assets/images/img_food_1.png
  AssetGenImage get imgFood1 =>
      const AssetGenImage('assets/images/img_food_1.png');

  /// File path: assets/images/img_food_2.png
  AssetGenImage get imgFood2 =>
      const AssetGenImage('assets/images/img_food_2.png');

  /// File path: assets/images/img_food_3.png
  AssetGenImage get imgFood3 =>
      const AssetGenImage('assets/images/img_food_3.png');

  /// File path: assets/images/img_intro_1.svg
  String get imgIntro1 => 'assets/images/img_intro_1.svg';

  /// File path: assets/images/img_intro_2.svg
  String get imgIntro2 => 'assets/images/img_intro_2.svg';

  /// File path: assets/images/img_logo_splash.png
  AssetGenImage get imgLogoSplash =>
      const AssetGenImage('assets/images/img_logo_splash.png');

  /// File path: assets/images/img_promotion.png
  AssetGenImage get imgPromotion =>
      const AssetGenImage('assets/images/img_promotion.png');

  /// File path: assets/images/img_restaurant_1.png
  AssetGenImage get imgRestaurant1 =>
      const AssetGenImage('assets/images/img_restaurant_1.png');

  /// File path: assets/images/img_restaurant_2.png
  AssetGenImage get imgRestaurant2 =>
      const AssetGenImage('assets/images/img_restaurant_2.png');

  /// File path: assets/images/img_restaurant_3.png
  AssetGenImage get imgRestaurant3 =>
      const AssetGenImage('assets/images/img_restaurant_3.png');

  /// File path: assets/images/img_restaurant_4.png
  AssetGenImage get imgRestaurant4 =>
      const AssetGenImage('assets/images/img_restaurant_4.png');

  /// List of all assets
  List<dynamic> get values => [
        icFacebook,
        icFilter,
        icGoogle,
        icNotification,
        icSearch,
        imgBgApp,
        imgBgApp2,
        imgFood1,
        imgFood2,
        imgFood3,
        imgIntro1,
        imgIntro2,
        imgLogoSplash,
        imgPromotion,
        imgRestaurant1,
        imgRestaurant2,
        imgRestaurant3,
        imgRestaurant4
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
