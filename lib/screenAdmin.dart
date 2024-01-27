import 'package:best/features/authentication/screens/login/login.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: SafeArea(
      child: ScreenAdmin(),
    ),
    debugShowCheckedModeBanner: false,
  ),
);

class ScreenAdmin extends StatefulWidget {
  const ScreenAdmin({Key? key}) : super(key: key);

  @override
  State<ScreenAdmin> createState() => _ScreenAdminState();
}

class _ScreenAdminState extends State<ScreenAdmin> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          SizedBox(
            height: 90,
            width: 90,
            child: CachedNetworkImage(
              imageUrl:
              "https://icons.iconarchive.com/icons/iconarchive/dog-breed/512/Basset-Hound-icon.png",
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                  width: 240,
                  child: Text('BEST', style: TextStyle(fontSize: 24))),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications_none)),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (builder) => const LoginScreen()));
                  },
                  icon: const Icon(Icons.account_circle_outlined))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: 70,
                  width: 70,
                  color: Colors.blue,
                  child: const Text('', style: TextStyle(fontSize: 24))),
              Container(
                  height: 70,
                  width: 70,
                  color: Colors.blue,
                  child: const Text('', style: TextStyle(fontSize: 24))),
              Container(
                  height: 70,
                  width: 70,
                  color: Colors.blue,
                  child: const Text('', style: TextStyle(fontSize: 24))),
            ],
          ),
          const Text(''),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Order', style: TextStyle(fontSize: 15)),
              Text(' Ratting', style: TextStyle(fontSize: 15)),
              Text(' Product', style: TextStyle(fontSize: 15))
            ],
          ),
          const Text('\n'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: 70,
                  width: 70,
                  color: Colors.blue,
                  child: const Text('', style: TextStyle(fontSize: 24))),
              Container(
                  height: 70,
                  width: 70,
                  color: Colors.blue,
                  child: const Text('', style: TextStyle(fontSize: 24))),
              Container(
                  height: 70,
                  width: 70,
                  color: Colors.blue,
                  child: const Text('', style: TextStyle(fontSize: 24))),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Chat', style: TextStyle(fontSize: 15)),
              Text(' ???', style: TextStyle(fontSize: 15)),
              Text(' ???', style: TextStyle(fontSize: 15))
            ],
          ),
        ]),
      ),
    );
  }
}
