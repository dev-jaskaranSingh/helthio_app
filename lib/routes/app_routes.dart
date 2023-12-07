import 'package:flutter/material.dart';
import 'package:helthio/presentation/splash_screen/splash_screen.dart';
import 'package:helthio/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:helthio/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:helthio/presentation/login_screen/login_screen.dart';
import 'package:helthio/presentation/home_container_screen/home_container_screen.dart';
import 'package:helthio/presentation/top_doctor_screen/top_doctor_screen.dart';
import 'package:helthio/presentation/doctor_detail_screen/doctor_detail_screen.dart';
import 'package:helthio/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingScreen = '/onboarding_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String loginScreen = '/login_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String topDoctorScreen = '/top_doctor_screen';

  static const String doctorDetailScreen = '/doctor_detail_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        onboardingScreen: OnboardingScreen.builder,
        signUpScreen: SignUpScreen.builder,
        loginScreen: LoginScreen.builder,
        homeContainerScreen: HomeContainerScreen.builder,
        topDoctorScreen: TopDoctorScreen.builder,
        doctorDetailScreen: DoctorDetailScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
