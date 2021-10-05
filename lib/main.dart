import 'package:classroom_manager/services/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<RoomProvider>(
              create: (_) => RoomProvider()),
          
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Classroom Manager',
          theme: ThemeData(
            fontFamily: 'GreycliffCF',
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ));
  }
}
