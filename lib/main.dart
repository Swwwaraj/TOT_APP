import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/dog_provider.dart';
import 'providers/location_provider.dart';
import 'providers/database_provider.dart';
import 'screens/dog_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DogProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
      ],
      child: MaterialApp(
        title: 'TOT APP',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: DogListScreen(), 
      ),
    );
  }
}