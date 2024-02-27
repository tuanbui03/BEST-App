import 'package:best/common/widgets/appbar/appbar.dart';
import 'package:best/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:best/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:best/features/shop/screens/product_reviews/widgets/user_reviews.dart';
import 'package:best/utils/constants/colors.dart';
import 'package:best/utils/constants/sizes.dart';
import 'package:best/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget{
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      /// Appbar
      appBar: const TAppBar(title: Text('Reviews & Ratings')),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ratings and reviews are verified and arr from people who use the same type of device that you use."),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text("12,456", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}



