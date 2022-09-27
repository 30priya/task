import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Cart'), actions: <Widget>[
        Stack(children: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          new Positioned(
            right: 0,
              child: new Stack(
            children: <Widget>[
              new Icon(Icons.brightness_1,
                  size: 20.0, color: Colors.green[800]),
              new Positioned(
                  top: 3.0,
                  right: 4.0,
                  child: new
                  Obx(()=>

                  Center(
                    child: new Text(
                      controller.totalQuantity.value.toString(),
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ))),
            ],
          ))
        ]),

/*      IconButton(

      icon: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      onPressed: () {
        // do something
      },
    )*/
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemCount: controller.productList.value.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 0),
                        child: Row(
                          children: [
                            Image.asset(controller.productList[index].image!,
                                height: 50, width: 50),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller
                                        .productList[index].productName
                                        .toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller
                                        .productList[index].item
                                        .toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "RS " +
                                          controller
                                              .funPerItemPriceTotal(index)
                                              .toString(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FloatingActionButton(
                              child: Icon(Icons.add, color: Colors.black87),
                              backgroundColor: Colors.white,
                              onPressed: () {
                                controller.increment(index);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(controller.productList[index].quantity
                                  .toString()),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                controller.decrement(index);
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.white,
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: Divider(color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
            ),
            Obx(() => Container(
                  width: Get.size.width,
                  margin: const EdgeInsets.only(
                      bottom: 10, left: 40, right: 20, top: 10),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Total " +
                              "RS ${double.parse((controller.totalAmount.value).toString()).toStringAsFixed(2)}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          (controller.totalQuantity.value).toString() + " item",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
