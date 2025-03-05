import 'package:assignment_03/controller/product_controller.dart';
import 'package:assignment_03/widgets/single_product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController productController = ProductController();
  Future<void> fetchData() async {
    await productController.fetchProducts();

    setState(() {});
  }

  void productDialog(
      {String? id,
      String? name,
      int? qty,
      String? img,
      int? unitPrice,
      int? totalPrice}) {
    TextEditingController productNameController = TextEditingController();

    TextEditingController productQtyController = TextEditingController();
    TextEditingController productImageController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();

    productNameController.text = name ?? '';
    productQtyController.text = qty != null ? qty.toString() : '';
    productImageController.text = img ?? '';

    productUnitPriceController.text =
        unitPrice != null ? unitPrice.toString() : '';
    productTotalPriceController.text =
        totalPrice != null ? totalPrice.toString() : '';

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 10,
              backgroundColor: Colors.white,
              scrollable: true,
              title: Text(id == null ? 'Add product' : 'Update product'),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.98,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: productNameController,
                        decoration:
                            const InputDecoration(labelText: 'Product name'),
                      ),
                      TextField(
                        controller: productImageController,
                        decoration:
                            const InputDecoration(labelText: 'Product Image'),
                      ),
                      TextField(
                        controller: productQtyController,
                        decoration:
                            const InputDecoration(labelText: 'Product Qty'),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      TextField(
                        controller: productUnitPriceController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(
                            labelText: 'Product unit price'),
                      ),
                      TextField(
                        controller: productTotalPriceController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration:
                            const InputDecoration(labelText: 'Total price'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Close')),
                          const SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (id == null) {
                                  productController.createProduct(
                                      productNameController.text,
                                      productImageController.text,
                                      int.parse(productQtyController.text),
                                      int.parse(
                                          productUnitPriceController.text),
                                      int.parse(
                                          productTotalPriceController.text));
                                } else {
                                  productController.updateProduct(
                                      id,
                                      productNameController.text,
                                      productImageController.text,
                                      int.parse(productQtyController.text),
                                      int.parse(
                                          productUnitPriceController.text),
                                      int.parse(
                                          productTotalPriceController.text));
                                }

                                Navigator.pop(context);
                                setState(() {
                                  fetchData();
                                });
                              },
                              child: Text(id == null
                                  ? 'Add product'
                                  : 'Update product')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 300,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8),
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          var product = productController.products[index];
          return ProductCard(
            product: product,
            onEdit: () => productDialog(
              id: product.sId,
              name: product.productName,
              img: product.img,
              qty: product.qty,
              unitPrice: product.unitPrice,
              totalPrice: product.totalPrice,
            ),
            onDelete: () {
              productController
                  .deleteProducts(product.sId.toString())
                  .then((value) {
                if (value) {
                  setState(() {
                    fetchData();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Product deleted"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Something wrong try again"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => productDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
