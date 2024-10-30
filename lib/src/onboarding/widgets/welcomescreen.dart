import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/utils/kstrings.dart';
import 'package:gromuse/commons/widgets/app_style.dart';
import 'package:gromuse/commons/widgets/custom_button.dart';
import 'package:gromuse/commons/widgets/reusable_text.dart';
import 'package:gromuse/const/resource.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              width: 500.w,
              height: 500.h,
              fit: BoxFit.contain,
              R.ASSETS_IMAGES_ONBOARDING3_PNG,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              AppText.kWelcomeHeader,
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
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(
                    text: 'Already have an Account ?',
                    style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: Text(
                    'Sign In',
                    style: appStyle(12, Kolors.kPrimary, FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
