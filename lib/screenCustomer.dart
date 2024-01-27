import 'package:best/features/authentication/screens/login/login.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

void main() {
  runApp(const MaterialApp(
    home: ScreenCustomer(),
    debugShowCheckedModeBanner: false,
  ));
}

class ScreenCustomer extends StatefulWidget {
  const ScreenCustomer({Key? key}) : super(key: key);

  @override
  State<ScreenCustomer> createState() => _ScreenCustomerState();
}

class _ScreenCustomerState extends State<ScreenCustomer> {
  final searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          width: 300,
          height: 40,
          color: Colors.white,
          child: TextField(
            controller: searchCtrl,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
          ),
        ),
        actions: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message_outlined),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.local_grocery_store_outlined),
                  color: Colors.black,
                ),
              ])
        ],
      ),
      body: FooterView(
          footer: Footer(
            padding: const EdgeInsets.all(5.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 900,
                  width: 600,
                  child: CachedNetworkImage(
                    imageUrl:
                    "https://icons.iconarchive.com/icons/iconarchive/dog-breed/512/Basset-Hound-icon.png",
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ],
            )
          ]),
      persistentFooterButtons: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.home_outlined)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.storefront)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (builder) => const LoginScreen()));
                    },
                    icon: const Icon(Icons.perm_identity)),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Home'),
                Text('Store'),
                Text('Wishlist'),
                Text('Profile'),
              ],
            )
          ],
        ),
      ],
    );
  }
}
