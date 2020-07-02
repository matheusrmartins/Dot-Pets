import 'package:flutter/material.dart';
import 'file:///C:/Users/Matheus/AndroidStudioProjects/xlo/lib/screens/base/base_screen.dart';
import 'package:provider/provider.dart';
import 'package:xlo/blocks/drawer_bloc.dart';
import 'package:xlo/blocks/home_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider (
      providers: [
        Provider<DrawerBloc>(
          create: (_) => DrawerBloc(),
          dispose: (context, value) => value.dispose(),
        ),
        Provider<HomeBloc>(
          create: (_) => HomeBloc(),
          dispose: (context, value) => value.dispose(),
        )
      ],
     child: MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BaseScreen(),
    )
    );
  }
}