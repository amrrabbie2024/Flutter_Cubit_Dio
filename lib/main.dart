import 'package:flutter/material.dart';
import 'package:flutter_cubit_dio/core/get_it.dart';
import 'package:flutter_cubit_dio/core/kiwi.dart';

import 'core/logic/helper_methods.dart';
import 'views/login/view.dart';
import 'views/movies/view.dart';
import 'views/weather/view.dart';
 Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  initKiwi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigtorKey,
      title: 'Cubit Dio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green,primary: Colors.blue),
        useMaterial3: true,

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 28)
        ),

        iconTheme: IconThemeData(
          color: Colors.green
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.green,
            textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22 ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color:Colors.orange,width: 2)
            )
          )
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 21),
          )
        )

      ),
      home: const LoginView(),
    );
  }
}


