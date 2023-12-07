import 'package:flutter/material.dart';
import 'package:helthio/presentation/onboarding_screen/models/onboarding_model.dart';

/// A provider class for the OnboardingScreen.
///
/// This provider manages the state of the OnboardingScreen, including the
/// current onboardingModelObj
class OnboardingProvider extends ChangeNotifier {
  OnboardingModel onboardingModelObj = OnboardingModel();

  @override
  void dispose() {
    super.dispose();
  }
}
