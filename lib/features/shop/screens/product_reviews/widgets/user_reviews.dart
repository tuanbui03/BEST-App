import 'package:best/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:best/common/widgets/products/ratings/rating_indicator.dart';
import 'package:best/utils/constants/colors.dart';
import 'package:best/utils/constants/image_strings.dart';
import 'package:best/utils/constants/sizes.dart';
import 'package:best/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Anh Tuan', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('27 Feb, 2024', style: Theme.of(context).textTheme.bodyMedium),
            ],
        ),
            SizedBox(height: TSizes.spaceBtwItems),
            ReadMoreText(
             'Day la review no co the dai nen an vao show more nhe ^.^',
             trimLines: 2,
             trimMode: TrimMode.Line,
             trimExpandedText: 'show less',
             trimCollapsedText: 'show more',
              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
              lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Company Review
            TRoundedContainer(
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Store 1', style: Theme.of(context).textTheme.titleMedium),
                        Text('27 Feb, 2024', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),
                    ReadMoreText(
                      'Day la review no co the dai nen an vao show more nhe ^.^',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimExpandedText: 'show less',
                      trimCollapsedText: 'show more',
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                    ),
                  ],
                ),
              ),
            ),
        const SizedBox(height: TSizes.spaceBtwSections),
          ],
    );
  }
}