import 'package:clothingapp/product_details.dart';
import 'package:clothingapp/tabss/info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Women extends StatefulWidget {
  const Women({Key? key}) : super(key: key);

  @override
  State<Women> createState() => _WomenState();
}

class _WomenState extends State<Women> {
  final List _products = [];
  final _firestoreInstance = FirebaseFirestore.instance;

  fetchProducts() async {
    QuerySnapshot qn =
        await _firestoreInstance.collection("Home Products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "user-profile": qn.docs[i]["user-profile"],
          "product-name": qn.docs[i]["product-name"],
          "product-price": qn.docs[i]["product-price"],
          "username": qn.docs[i]["username"],
          "subtitle": qn.docs[i]["subtitle"],
          "product-description": qn.docs[i]["product-description"],
          "product-imgs": qn.docs[i]["product-imgs"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _products.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ProductDetails(
                                        product: _products[index],
                                      )));
                        },
                        child: Container(
                          width: 335.w,
                          height: 520.h,
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image.network(
                                  _products[index]["user-profile"],
                                ),
                                title: Text(_products[index]["username"]),
                                subtitle: Text(_products[index]["subtitle"]),
                                trailing: SingleChildScrollView(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        "assets/images/Vectorss.png",
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      const Text("2.3k")
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                    "${_products[index]["product-description"]}"),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              SizedBox(
                                // color: Colors.red,
                                height:
                                    // 190.h,
                                    MediaQuery.of(context).size.height * 0.23,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        _products[index]["product-imgs"][0],
                                        fit: BoxFit.fitWidth,
                                        height: 300,
                                      ),
                                      Column(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                              _products[index]["product-imgs"]
                                                  [1],
                                              scale: 0.7,
                                            ),
                                          ),
                                          Expanded(
                                            child: Image.network(
                                              _products[index]["product-imgs"]
                                                  [2],
                                              scale: 0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                              _products[index]["product-imgs"]
                                                  [3],
                                              scale: 0.7,
                                            ),
                                          ),
                                          Expanded(
                                            child: Image.network(
                                              _products[index]["product-imgs"]
                                                  [4],
                                              scale: 0.7,
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(254, 37, 80, 1),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Center(
                                        child: Text(
                                          "#Summer",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 70.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(254, 37, 80, 1),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Info(
                                                      products1:
                                                          _products[index],
                                                    ))),
                                        child: const Center(
                                          child: Text(
                                            "#Purple",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
