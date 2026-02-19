import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const Color kBrandOrange = Color(0xFFFF8200);
const Color kDarkBackground = Color(0xFF121212);
const Color kDarkSurface = Color(0xFF1A1A1A);
const Color kDarkTertiaryContainer = Color(0xFF1E1E1E);

const Color kLightBackground = Color(0xFFD0D0D0);
const Color kLightSurface = Color(0xFFDDDDDD);
const Color kLightTertiaryContainer = Color(0x0ffc6c66);

final ThemeData darkTheme =
    FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: kDarkBackground,
        primaryContainer: kDarkSurface,
        secondary: kBrandOrange,
        secondaryContainer: Color(0xFF4A2600),
        tertiary: Color(0xFFBBBBBB),
        tertiaryContainer: kDarkTertiaryContainer,
      ),
      useMaterial3: true,
      keyColors: const FlexKeyColors(useSecondary: false, useTertiary: false),
      blendLevel: 0,
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        defaultRadius: 12.0,
        elevatedButtonSchemeColor: SchemeColor.secondary,
        elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        inputDecoratorSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: false,
        inputDecoratorFocusedBorderWidth: 1.0,
      ),
    ).copyWith(
      colorScheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: kDarkBackground,
          primaryContainer: kDarkSurface,
          secondary: kBrandOrange,
          secondaryContainer: Color(0xFF4A2600),
          tertiary: Color(0xFFBBBBBB),
          tertiaryContainer: kDarkTertiaryContainer,
        ),
      ).colorScheme.copyWith(secondary: kBrandOrange),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white70),
        labelStyle: TextStyle(color: Colors.white),
        prefixStyle: TextStyle(color: Colors.white70),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: kBrandOrange,
        ),
      ),
    );

final ThemeData lightTheme =
    FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: kLightBackground,
        primaryContainer: kLightSurface,
        secondary: kBrandOrange,
        secondaryContainer: Color(0xFFFFE0B2),
        tertiary: Color(0xFF333333),
        tertiaryContainer: kLightTertiaryContainer,
      ),
      useMaterial3: true,
      keyColors: const FlexKeyColors(useSecondary: false, useTertiary: false),
      blendLevel: 0,
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        defaultRadius: 12.0,
        elevatedButtonSchemeColor: SchemeColor.secondary,
        elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        inputDecoratorSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: false,
        inputDecoratorFocusedBorderWidth: 1.0,
      ),
    ).copyWith(
      colorScheme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: kLightBackground,
          primaryContainer: kLightSurface,
          secondary: kBrandOrange,
          secondaryContainer: Color(0xFFFFE0B2),
          tertiary: Color(0xFF333333),
          tertiaryContainer: kLightTertiaryContainer,
        ),
      ).colorScheme.copyWith(secondary: kBrandOrange),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.black38),
        labelStyle: TextStyle(color: Colors.black87),
        prefixStyle: TextStyle(color: Colors.black54),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: kBrandOrange,
        ),
      ),
    );
