import 'package:best/utils/constants/image_strings.dart';
import 'package:best/utils/constants/sizes.dart';
import 'package:best/utils/constants/text_string.dart';
import 'package:best/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scroll Pages
          PageView(
            children: [
              Column(
                children: [
                  Image(
                    width: THelperFunctions.screenWidth() * 0.8,
                    height: THelperFunctions.screenHeight() * 0.6,
                    image: const AssetImage(TImages.onBoardingImage1),
                  ),
                  Text(
                    TTexts.onBoardingTitle1,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    TTexts.onBoardingSubTitle1,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),

          /// Skip Button
          ///
          /// Dot Navigation SmoothPageIndicator
          ///
          /// Circular Button
        ],
      ),
    );
  }
}
