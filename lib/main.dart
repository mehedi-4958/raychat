import 'package:flutter/material.dart';
import 'package:raychat/ui/message_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: Add MultiProvider
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ray Chat',
      theme: ThemeData(
        primaryColor: const Color(0xFF3D814A),
      ),
      // TODO: Add Consumer<UserDao> here
      home: const MessageList(),
      // TODO: Add closing parenthesis
    );
  }
}
