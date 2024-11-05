import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/utils/kstrings.dart';
import 'package:gromuse/commons/widgets/app_style.dart';
import 'package:gromuse/commons/widgets/custom_button.dart';
import 'package:gromuse/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Kolors.kPrimaryLight,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Image.asset(
              width: 400.w,
              height: 400.h,
              fit: BoxFit.contain,
              R.ASSETS_IMAGES_ONBOARDING2_PNG,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              AppText.kOnboardWishList,
              textAlign: TextAlign.center,
              style: appStyle(
                18,
                Kolors.kDark,
                FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
           
            SizedBox(
              height: 20.h,
            ),
            GradientBtn(
              text: AppText.kGetStarted,
              textSize: 14,
              btnHieght: 35,
              radius: 20,
              btnWidth: ScreenUtil().screenWidth - 100,
              onTap: () {
                //Todo  uncomment storage
                //Storage().setBool("firstOpen", true)
                context.go('/home');
              },
            )
          ],
        ),
      ),
    );
  }
}
