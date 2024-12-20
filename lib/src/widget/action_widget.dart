import 'package:flutter/material.dart';

import '../../showcaseview.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget({
    super.key,
    required this.children,
    required this.tooltipActionConfig,
    required this.alignment,
    required this.crossAxisAlignment,
    required this.isArrowUp,
    required this.currentStep,
    required this.totalSteps,
    this.outSidePadding = EdgeInsets.zero,
    this.width,
    this.stepsTextStyle,
  });

  final TooltipActionConfig tooltipActionConfig;
  final List<Widget> children;
  final double? width;
  final MainAxisAlignment alignment;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets outSidePadding;
  final bool isArrowUp;
  final int currentStep;
  final int totalSteps;
  final TextStyle? stepsTextStyle;

  @override
  Widget build(BuildContext context) {
    final getWidgetPadding = EdgeInsets.only(
      top: isArrowUp ? tooltipActionConfig.gapBetweenContentAndAction : 0.0,
      bottom: !isArrowUp ? tooltipActionConfig.gapBetweenContentAndAction : 0.0,
    ).add(outSidePadding);

    return SizedBox(
      width: width,
      child: Padding(
        padding: getWidgetPadding,
        child: Row(
          mainAxisSize: width == null ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: width == null ? MainAxisAlignment.end : alignment,
          textBaseline: tooltipActionConfig.textBaseline,
          children: [
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${currentStep + 1}/$totalSteps',
                  style: tooltipActionConfig.stepsTextStyle,
                ),
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
