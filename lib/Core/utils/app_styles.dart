import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/size_config.dart';

abstract class AppStyles {
  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyMedium?.color,
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  // better for mobile and no context;
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // var width = physicalWidth / devicePixelRatio;
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tabletBreakPoint) {
    return width / 450;
  } else {
    return width / 800;
  }
}
