import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:clothingapp/tabss/info.dart';
import 'package:clothingapp/tabss/measurements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  var product;

  ProductDetails({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List product = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Stack(
            children: [
              SizedBox(
                height: 400.h,
                width: double.infinity,
                child: Carousel(
                  dotColor: Colors.grey,
                  dotBgColor: Colors.transparent,
                  dotIncreasedColor: const Color(0xffFE2550),
                  dotSize: 6.0,
                  autoplay: false,
                  images: [
                    Image.network(
                      widget.product["product-imgs"][0],
                      fit: BoxFit.fill,
                    ),
                    Image.network(
                      widget.product["product-imgs"][1],
                      fit: BoxFit.fill,
                    ),
                    Image.network(
                      widget.product["product-imgs"][2],
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      widget.product["product-imgs"][3],
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      widget.product["product-imgs"][4],
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_outlined)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: Colors.black,
                          )),
                      SizedBox(width: 8)
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              widget.product["product-name"],
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              widget.product["product-price"].toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xffFE2550),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              SizedBox(height: 10.h),
              SizedBox(
                width: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TabBar(
                        labelColor: Colors.black,
                        indicatorColor: const Color(0xffFE2550),
                        controller: tabController,
                        tabs: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Info(
                                          products1: product,
                                        ))),
                            child: Tab(
                              text: 'INFO',
                            ),
                          ),
                          Tab(
                            text: 'MEASUREMENTS',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Info(
                      products1: widget.product,
                    ),
                    Measurements(),
                  ],
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
