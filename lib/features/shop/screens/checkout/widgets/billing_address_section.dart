import 'package:best/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:best/common/widgets/texts/section_heading.dart';
import 'package:best/utils/constants/colors.dart';
import 'package:best/utils/constants/image_strings.dart';
import 'package:best/utils/constants/sizes.dart';
import 'package:best/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({
    super.key,
});

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed:(){}),
        Text('Test', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('113', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: Text('So 7 Thien Quang, HN', style: Theme.of(context).textTheme.bodyMedium, softWrap: true))
          ],
        )
      ],
    );
  }

}