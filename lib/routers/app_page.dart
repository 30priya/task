import 'package:get/get.dart';
import 'package:task_product_list/home/home_binding.dart';
import 'package:task_product_list/home/home_view.dart';

import 'app_router.dart';
class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 550,
  );
  static final pages = [
    GetPage(
      name: AppRoutes.initial_page,
      transitionDuration: transitionDuration,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.native,
    ),
  ];
}