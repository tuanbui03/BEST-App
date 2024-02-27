// //pubspec.ytaml  - http: ^0.13.4
// import 'package:flutter/material.dart';
// import 'Model/brand.dart';
// import 'api/feedbackAPI.dart';
// import 'model/feedback.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   static const String _title = 'Flutter Stateful Clicker Counter';
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       theme: ThemeData(
//         // useMaterial3: true,
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// List listPayment = [];
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<dynamic> users = [];
//   final nameCtrl = TextEditingController();
//   final descriptoin = TextEditingController();
//   final idCtrl = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Rest API Call'),
//       ),
//       body: Column(
//         children: [
//           TextFormField(
//             controller: idCtrl,
//             decoration: const InputDecoration(
//               labelText: 'ID',
//             ),
//           ),
//           TextFormField(
//             controller: nameCtrl,
//             decoration: const InputDecoration(
//               labelText: 'Payment Name',
//             ),
//           ),
//           TextFormField(
//             controller: descriptoin,
//             decoration: const InputDecoration(
//               labelText: 'Descri1ption',
//             ),
//           ),
//           Row(
//             children: [
//               TextButton(
//                   child: Text('List'),
//                   onPressed: () async {
//                     listPayment = await FeedbackAPI.getFeedbacks();
//                     print(listPayment);
//                   }),
//               TextButton(
//                 child: Text('ByID'),
//                 onPressed: () async {
//                   dynamic payment =
//                   await FeedbackAPI.getFeedbackByID(int.parse(idCtrl.text));
//                   print(payment);
//                 },
//               ),
//               TextButton(
//                   onPressed: () async {
//                     Feedbacks feedback = Feedbacks(0, int.parse(nameCtrl.text),
//                         int.parse(descriptoin.text), "Hope");
//                     dynamic result = await FeedbackAPI.addFeedback(feedback);
//                     print('Add $result');
//                   },
//                   child: Text('Add')),
//               TextButton(
//                   onPressed: () async {
//                     Feedbacks feedback = Feedbacks(0, int.parse(nameCtrl.text),
//                         int.parse(descriptoin.text), "Hope333");
//                     dynamic result = await FeedbackAPI.updateFeedback(feedback);
//                     print('Add $result');
//                     print('Update: $result');
//                   },
//                   child: Text('Update')),
//               TextButton(
//                   onPressed: () async {
//                     dynamic result = await FeedbackAPI.deleteFeedbackByID(
//                         int.parse(idCtrl.text));
//                     print('Delete : $result');
//                   },
//                   child: Text('Delete')),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
// //