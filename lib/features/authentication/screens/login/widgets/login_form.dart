import 'package:best/repository/usersRepos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../entity/users.dart';
import '../../../../../screenAdmin.dart';
import '../../../../../screenCustomer.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';

List user = [];

class TLoginForm extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller:  emailCtrl,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              controller: passwordCtrl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember ME & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                /// Forget password
                TextButton(
                    onPressed: () {},
                    child: const Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign in button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton (
                    onPressed: () async {
                      user = await UserCtrl.findByEmail(emailCtrl.text);
                      if(user.isNotEmpty && passwordCtrl.text == user[0]['Password']){
                        if (user[0]['Role'] == 1) {
                          Navigator.push(context,MaterialPageRoute(builder: (builder) => ScreenAdmin()));
                        }else{
                          Navigator.push( context, MaterialPageRoute( builder: (builder) => ScreenCustomer()));
                        }
                      }
                    },
                    child: const Text(TTexts.signIn))),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Creat account button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
