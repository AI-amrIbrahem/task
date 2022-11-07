import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task/utils/app/my_app.dart';
import 'package:task/utils/di/injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppInjection();
  HttpOverrides.global = MyHttpOverrides();


  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}