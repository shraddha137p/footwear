import 'package:flutter/material.dart';
import 'package:foot_were_project/controller/home_controller.dart';
import 'package:foot_were_project/pages/add_product_page.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Footwear Admin'),
        ),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  ctrl.products[index].name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  (ctrl.products[index].price ?? 0).toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                ),
                trailing: IconButton(
                    onPressed: () {
                      ctrl.deleteProduct(ctrl.products[index].id ?? '');
                      ctrl.update();
                    },
                    icon: const Icon(Icons.delete)),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const AddProductPage());
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
