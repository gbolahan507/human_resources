import 'package:flutter/material.dart';
import 'package:human_resources/navigation_screen.dart';
import 'package:human_resources/util/router.dart';
import 'package:human_resources/widgets/custom_button.dart';
import 'package:human_resources/widgets/custom_text_widget.dart';
import 'package:human_resources/widgets/export.dart';

class LandPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            '3LINE',
            fontSize: 13,
            color: Styles.appBackground1,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(
                    height: 50,
                    title: 'Next',
                    onPressed: () {
                      routeToReplace(context, NavigationScreen());
                    },
                  ),
                ),
              ),
              verticalSpaceSmall,
              Image.asset(
                'images/razorpay.png',
              ),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/3linelogo.png',
                    width: screenAwareSize(93, context, width: true),
                  ),
                  horizontalSpaceMedium,
                  Image.asset(
                    'images/certified.png',
                    width: screenAwareSize(93, context, width: true),
                  ),
                ],
              ),
              verticalSpaceMedium,
            ],
          ),
        ));
  }
}
