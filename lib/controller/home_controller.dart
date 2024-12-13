import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foot_were_project/model/products/products.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
   CollectionReference? productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImageCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'general';
  String brand = 'un branded';
  bool offer = false;

  List<Products> products = [];
  @override
  Future<void> onInit() async {
    await fetchProduct();
    productCollection = firestore.collection('products');
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection!.doc();
      Products product = Products(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: int.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImageCtrl.text,
        offer: offer,
      );
      final productsJson = product.toJson();
      doc.set(productsJson);
      Get.snackbar('Success', 'Product added successfully',
          colorText: Colors.green);
      saveValueDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.green);
      print(e);
    }
  }

  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection!.get();

      final List<Products> retrievedProducts = productSnapshot.docs
          .map((doc) => Products.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrievedProducts);
      print(retrievedProducts);
      Get.snackbar('Success', 'Products fetch successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', '$e', colorText: Colors.green);
      print(e.toString());
    }finally{
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection!.doc(id).delete();
      fetchProduct();
      Get.snackbar('Deleted', 'Products Deleted successfully',
          colorText: Colors.green);
    } catch (e) {
       Get.snackbar('Deleted', '$e',
          colorText: Colors.green);
      print(e);

    }
  }

  saveValueDefault() {
    productDescriptionCtrl.clear();
    productImageCtrl.clear();
    productNameCtrl.clear();
    productPriceCtrl.clear();

    category = 'general';
    brand = 'un branded';
    offer = false;
    update();
  }
}
