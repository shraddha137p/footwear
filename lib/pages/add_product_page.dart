import 'package:flutter/material.dart';
import 'package:foot_were_project/controller/home_controller.dart';
import 'package:foot_were_project/pages/widget/drop_down_btn.dart';
import 'package:get/get.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final List<String> categories = ['Cate1', 'Cate2', 'Cate3', 'Cate4'];
  final List<String> brands = ['Brandi1', 'Brandi2', 'Brandi3', 'Brandi4'];
  final List<String> offers = ['true', 'false'];

  String? selectedCategory;
  String? selectedBrand;
  String? selectedOffer;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add Products'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Add New Product',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text('Product Name'),
                    hintText: 'Enter Product Name',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text('Product Description'),
                    hintText: 'Enter Product Description',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.productImageCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text('Product Image'),
                    hintText: 'Image URL',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text('Product Price'),
                    hintText: 'Enter Product Price',
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CustomDropDownBtn(
                        items: const [
                          'Boots',
                          'Shoe',
                          'Beach Shoe',
                          'High heels'
                        ],
                        selectedItemText: ctrl.category,
                        onSelected: (selectedValue) {
                          ctrl.category = selectedValue;
                          ctrl.update();
                          print(ctrl.category);
                        },
                      ),
                    ),
                    Flexible(
                      child: CustomDropDownBtn(
                        items: const ['Puma', 'Sketchers', 'Adidas', 'Clraks'],
                        selectedItemText: ctrl.brand,
                        onSelected: (selectedValue) {
                          ctrl.brand = selectedValue;
                          ctrl.update();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Offer Product?'),
                const SizedBox(height: 10),
                CustomDropDownBtn(
                  items: offers,
                  selectedItemText:   ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                    ctrl.offer = bool.tryParse(selectedValue) ?? false;
                    ctrl.update();
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    ctrl.addProduct();
                    print('Save data');
                  },
                  child: const Text('Add Product'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
