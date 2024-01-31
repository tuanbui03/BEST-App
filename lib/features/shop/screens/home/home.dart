import 'package:best/common/widgets/appbar/appbar.dart';
import 'package:best/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:best/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:best/utils/constants/colors.dart';
import 'package:best/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/products.cart/cart_menu_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Appbar
                  THomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




