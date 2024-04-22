import 'package:flutter/material.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  // final Color? activeTrackColor,
  //     inactiveTrackColor,
  //     activeThumbColor,
  //     inactiveThumbColor;
  final double width, height;
  final double thumbSize;
  final double spacingOfThumbTrack;

  final Color? activeBorderColor, inactiveBorderColor;

  CustomSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.width = 56,
    this.height = 28,
    this.thumbSize = 22, // this.activeTrackColor,
    // this.inactiveTrackColor,
    // this.activeThumbColor,
    // this.inactiveThumbColor,
    this.spacingOfThumbTrack = 4,
    this.activeBorderColor,
    this.inactiveBorderColor,
  }) : super(key: key);

  CustomSwitch.normal({
    Key? key,
    required this.value,
    this.onChanged,
    this.width = 48,
    this.height = 24,
    this.thumbSize = 20, // this.activeTrackColor,
    // this.inactiveTrackColor,
    // this.activeThumbColor,
    // this.inactiveThumbColor,
    this.spacingOfThumbTrack = 4,
    this.activeBorderColor,
    this.inactiveBorderColor,
  }) : super(key: key);

  CustomSwitch.small({
    Key? key,
    required this.value,
    this.onChanged,
    this.width = 32,
    this.height = 16,
    this.thumbSize = 13.5, // this.activeTrackColor,
    // this.inactiveTrackColor,
    // this.activeThumbColor,
    // this.inactiveThumbColor,
    this.spacingOfThumbTrack = 2.5,
    this.activeBorderColor,
    this.inactiveBorderColor,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin, UIMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Switch(value: true, onChanged: (v){});
    return GestureDetector(
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged!(!widget.value);
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: MySpacing.all(widget.spacingOfThumbTrack),
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.value
                    ? rightBarTheme.activeSwitchBorderColor
                    : rightBarTheme.onDisabled,
                width: 0.6),
            borderRadius: BorderRadius.circular(widget.height / 2),
            color: !widget.value
                ? rightBarTheme.disabled
                : theme.colorScheme.primary),
        child: Align(
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: widget.thumbSize,
            height: widget.thumbSize,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: !widget.value
                    ? rightBarTheme.onDisabled
                    : theme.colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
