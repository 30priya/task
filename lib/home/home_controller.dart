import 'package:get/get.dart';
import 'package:task_product_list/generated/assets.dart';

import 'package:task_product_list/model/product_model.dart';
import 'dart:io';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  var productList = <ProductModel>[].obs;
  var itemPriceTotal = 0.obs;
  var totalQuantity = 0.obs;
  var totalAmount = (0.0).obs;
  var count = 0.obs;

  @override
  void onInit() {
    Future.delayed(Duration.zero, () async {
      await listingData();
      await getTotalQuantity();
    });
  }

  listingData() {
    productList.add(ProductModel(
        productName: "Huddy",
        image: Assets.assetsHuddy,
        item: 100,
        quantity: 2));
    productList.add(ProductModel(
        productName: "Toper",
        image: Assets.assetsToper,
        item: 200,
        quantity: 2));
    productList.add(ProductModel(
        productName: "Tshirt",
        image: Assets.assetsTshirt,
        item: 50,
        quantity: 2));
    productList.add(ProductModel(
        productName: "Toper",
        image: Assets.assetsToper,
        item: 70,
        quantity: 0));
    productList.add(ProductModel(
        productName: "Huddy",
        image: Assets.assetsHuddy,
        item: 250,
        quantity: 1));
  }

  increment(index) {
    productList[index].quantity = productList[index].quantity! + 1;
    itemPriceTotal.value =
        productList[index].item! * productList[index].quantity!;
    getTotalQuantity();
    productList.refresh();
  }

  decrement(index) {
    if (productList[index].quantity != 0) {
      productList[index].quantity = productList[index].quantity! - 1;
      itemPriceTotal.value = productList[index].item! * productList[index].quantity!;
      getTotalQuantity();
      productList.refresh();
    }
  }

  getTotalQuantity() async {
    var box = Hive.box('myBox');
    totalQuantity.value = box.get('totalQuantity');
    totalAmount.value = box.get('totalAmount');
    totalQuantity.value = 0;
    totalAmount.value = 0.0;
    for (int i = 0; i < productList.length; i++) {
      totalQuantity.value = totalQuantity.value + productList[i].quantity!;
      totalAmount.value = totalAmount.value + productList[i].quantity! * productList[i].item!;



      if (box.isOpen) {
        box.put('totalQuantity', totalQuantity.value);
        box.put('totalAmount', totalAmount.value);


      } else {}
    }
  }

  funPerItemPriceTotal(index) {
    var itemPrice = productList[index].item;
    var totalItemPrice = itemPrice! * productList[index].quantity!;
    return totalItemPrice;
  }
}
