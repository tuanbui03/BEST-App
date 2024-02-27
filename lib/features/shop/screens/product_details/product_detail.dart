import 'package:best/common/widgets/appbar/appbar.dart';
import 'package:best/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:best/common/widgets/icons/t_circular_icon.dart';
import 'package:best/common/widgets/images/t_rounded_image.dart';
import 'package:best/common/widgets/texts/section_heading.dart';
import 'package:best/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:best/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:best/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:best/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:best/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:best/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:best/utils/constants/colors.dart';
import 'package:best/utils/constants/image_strings.dart';
import 'package:best/utils/constants/sizes.dart';
import 'package:best/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            TProductImageSlider(dark: dark),

            /// Product Details
            Padding(
              padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & share button
                  TRatingAndShare(),

                  /// Price, title, stock & brand
                  TProductMetaData(),

                  /// Attributes
                  TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text('Check Out'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Description
                  const TSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                      'Day la gioi thieu ve san pham. Goi description tu db vao nhe',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews(123)', showActionButton: false),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


