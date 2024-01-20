import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucky_games/features/games/widgets/coins.dart';
import 'package:lucky_games/features/games/widgets/lives.dart';
import 'package:lucky_games/features/games/widgets/settings_item.dart';
import 'package:lucky_games/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../games/widgets/back.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg/bg3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: pixelRatio * 10,
              right: pixelRatio * 10,
              left: pixelRatio * 10,
            ),
            child: Stack(
              children: [
                const Back(),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Settings'.toUpperCase(),
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Lives(),
                    SizedBox(width: 5),
                    Coins(),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: height / 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SettingsItem(
                          text: 'Privacy Policy',
                          image: 'assets/settings/privacy_policy.png',
                          callback: (_) {
                            context.router.push(const PrivacyPolicyRoute());
                          },
                        ),
                        SizedBox(height: height / 40),
                        SettingsItem(
                          text: 'Terms of use',
                          image: 'assets/settings/terms_of_use.png',
                          callback: (_) {
                            context.router.push(const TermsOfUseRoute());
                          },
                        ),
                        SizedBox(height: height / 40),
                        SettingsItem(
                          text: 'Rate app',
                          image: 'assets/settings/rate_app.png',
                          callback: (_) {},
                        ),
                        SizedBox(height: height / 40),
                        SettingsItem(
                          text: 'Support',
                          image: 'assets/settings/support.png',
                          callback: (_) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
