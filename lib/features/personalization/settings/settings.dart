import 'package:best/common/widgets/appbar/appbar.dart';
import 'package:best/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:best/common/widgets/images/t_circular_image.dart';
import 'package:best/common/widgets/list_title/settings_menu_tile.dart';
import 'package:best/common/widgets/texts/section_heading.dart';
import 'package:best/utils/constants/colors.dart';
import 'package:best/utils/constants/image_strings.dart';
import 'package:best/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/list_title/user_profile_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// AppBar
                    TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// User Profile Card
                    TUserProfileTitle(),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                )
            ),

            /// Body
            Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account & Settings
                  TSectionHeading(title: 'Account Settings', showActionButton: false,),
                  SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(icon: Iconsax.safe_home, title: 'Test', subTitle: 'Anh yeu em 123', onTap: (){},),
                  TSettingsMenuTile(icon: Iconsax.safe_home, title: 'Test', subTitle: 'Anh yeu em 123', onTap: (){},),
                  TSettingsMenuTile(icon: Iconsax.safe_home, title: 'Test', subTitle: 'Anh yeu em 123', onTap: (){},),
                  TSettingsMenuTile(icon: Iconsax.safe_home, title: 'Test', subTitle: 'Anh yeu em 123', onTap: (){},),
                  TSettingsMenuTile(icon: Iconsax.safe_home, title: 'Test', subTitle: 'Anh yeu em 123', onTap: (){},),

                  /// App Settings
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'App Settings', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load data', subTitle: 'Upload to Firebase'),
                  TSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value){}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: '???',
                    subTitle: 'True true true',
                    trailing: Switch(value: false, onChanged: (value){}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'T_T',
                    subTitle: 'Go go go',
                    trailing: Switch(value: false, onChanged: (value){}),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

