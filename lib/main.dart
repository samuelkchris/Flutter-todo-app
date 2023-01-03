import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_app/screens/home.dart';

import 'model/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo App',
        home: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                for (var feature in features)
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    leading: Container(
                      padding: const EdgeInsets.all(0),
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 3),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: feature.icon,
                    ),
                    title: Text(feature.name),
                    onTap: () {
                      // Navigate to the corresponding screen
                    },
                  ),
              ],
            ),
          ),
          body: Home(),
        ));
  }
}
