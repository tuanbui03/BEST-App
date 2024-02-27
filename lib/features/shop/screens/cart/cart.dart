import 'package:best/common/widgets/appbar/appbar.dart';
import 'package:best/common/widgets/icons/t_circular_icon.dart';
import 'package:best/common/widgets/images/t_rounded_image.dart';
import 'package:best/common/widgets/texts/product_price_text.dart';
import 'package:best/common/widgets/texts/product_title_text.dart';
import 'package:best/common/widgets/texts/t_brand_title_with_verfied_icon.dart';
import 'package:best/features/shop/screens/checkout/checkout.dart';
import 'package:best/utils/constants/colors.dart';
import 'package:best/utils/constants/image_strings.dart';
import 'package:best/utils/constants/sizes.dart';
import 'package:best/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),

          /// Items in Cart
          child: TCartItem()),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text('Checkout \$123.0')),
      ),
    );
  }
}
