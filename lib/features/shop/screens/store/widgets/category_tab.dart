import 'package:best/common/widgets/layouts/grid_layout.dart';
import 'package:best/common/widgets/products/product_cart/product_cart_vertical.dart';
import 'package:best/common/widgets/texts/section_heading.dart';
import 'package:best/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const TBrandShowCase(images: [TImages.productImage1, TImages.productImage1, TImages.productImage1]),
              const TBrandShowCase(images: [TImages.productImage1, TImages.productImage1, TImages.productImage1]),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Products
              TSectionHeading(title: 'You might like', onPressed: (){}),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(itemCount: 4, itemBuilder: (_, index) => TProductCardVertical())
            ],
          ),
        ),
      ]
    );
  }
}