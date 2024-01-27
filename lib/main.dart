import 'package:best/model/users.dart';
import 'package:flutter/material.dart';
import 'app.dart';

List listUser = [];

void main() async {
  // await WidgetsFlutterBinding.ensureInitialized();
  // UserCtrl.insertTable(Users(1,'tuan','bt','12345',1,'tuan@gmail.com', '', '012345678', 'hn','', 1,1));
  // UserCtrl.insertTable(Users(2,'nguyen','th','12345',1,'nguyen@gmail.com', '', '012345678', 'hn','', 0,1));
  // UserCtrl.insertTable(Users(3,'kiet','bt','12345',1,'kiet@gmail.com', '', '012345678', 'hn','', 0,1));
  listUser = await UserCtrl.getListTable();
  // print(listUser.toString());
  //  listUser = await UserCtrl.findByName('nguyen');
  //   print(listUser.toString());
  //
  //  print(listUser[0]['Username']);
  //  print(listUser[0]['Password']);
  //  print(listUser[0]['Role']);

   runApp(const App());
}

