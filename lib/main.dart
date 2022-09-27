import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';
import 'package:task_product_list/routers/app_page.dart';
import 'package:task_product_list/routers/app_router.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main()async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  // Hive.registerAdapter();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: "Task Product",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        getPages: AppPages.pages,
        initialRoute: AppRoutes.initial_page,
      );
    });
  }
}