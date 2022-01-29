import 'package:flutter/material.dart';

class Breakpoint {
  final int columns;
  final int gutters;
  final LayoutClass device;
  final double screenWidth;
  final double screenHeight;

  Breakpoint({
    required this.columns,
    required this.gutters,
    required this.device,
    required this.screenWidth,
    required this.screenHeight,
  });

  factory Breakpoint.fromMediaQuery(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);

    double _width = _mediaQuery.size.width;
    double _height = _mediaQuery.size.height;
    Orientation _orientation = _mediaQuery.orientation;

    return _calcBreakpoint(_orientation, _width, _height);
  }

  static Breakpoint _calcBreakpoint(Orientation orientation, double _width, double _height) {
    if (orientation == Orientation.landscape) {
      _width += 120;
    }

    if (_width >= 1440) {
      return Breakpoint(
        columns: 12,
        gutters: 24,
        screenWidth: _width,
        screenHeight: _height,
        device: LayoutClass.desktop,
      );
    }

    if (_width >= 600) {
      return Breakpoint(
        columns: 8,
        gutters: 16,
        screenWidth: _width,
        screenHeight: _height,
        device: LayoutClass.tablet,
      );
    }

    return Breakpoint(
      columns: 4,
      gutters: 16,
      screenWidth: _width,
      screenHeight: _height,
      device: LayoutClass.mobile,
    );
  }
}

enum LayoutClass {
  mobile,
  tablet,
  desktop,
}
