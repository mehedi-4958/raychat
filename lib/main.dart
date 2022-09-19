import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raychat/data/message_dao.dart';
import 'package:raychat/data/user_dao.dart';
import 'package:raychat/ui/login.dart';
import 'package:raychat/ui/message_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDao>(
          lazy: false,
          create: (_) => UserDao(),
        ),
        Provider<MessageDao>(
          create: (_) => MessageDao(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ray Chat',
        theme: ThemeData(
          primaryColor: const Color(0xFF3D814A),
        ),
        home: Consumer<UserDao>(
          builder: (context, userDao, child) {
            if (userDao.isLoggedIn()) {
              return const MessageList();
            } else {
              return const Login();
            }
          },
        ),
      ),
    );
  }
}
