import 'package:manwe/src/ui/utils/constants.dart';
import 'package:onboarding/onboarding.dart';

Indicator onBoardingIndicatorComponent() {
  return Indicator(
      closedIndicator: ClosedIndicator(
        color: kPrimaryColor,
        borderWidth: 0
      ),
      activeIndicator: ActiveIndicator(
        color: kBackgroundColor,
      ),
      indicatorDesign: IndicatorDesign.polygon(
          polygonDesign: PolygonDesign(
            polygonRadius: 15.0,
            polygonSpacer: 45.0,
            polygon: DesignType.polygon_circle,
          )
      )
  );
}