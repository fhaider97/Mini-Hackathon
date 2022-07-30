import 'package:clothingapp/search_screen.dart';
import 'package:clothingapp/tab_bar/children.dart';
import 'package:clothingapp/tab_bar/men.dart';
import 'package:clothingapp/tab_bar/women.dart';
import 'package:flutter/material.dart';

class TabBarrr extends StatefulWidget {
  const TabBarrr({Key? key}) : super(key: key);

  @override
  State<TabBarrr> createState() => _TabBarrrState();
}

class _TabBarrrState extends State<TabBarrr>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var women = Women();
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: ListTile(
              tileColor: Colors.white,
              leading:
                  CircleAvatar(child: Image.asset("assets/images/avatar.png")),
              title: SizedBox(
                height: 35,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SearchScreen()));
                  },
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: " Search ",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      suffixIcon:
                          const Icon(Icons.search_outlined, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    // onTap: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (_) => SearchScreen()));
                    // }
                  ),
                ),
              ),
            ),
            bottom: TabBar(
                labelColor: Colors.black,
                indicatorColor: const Color.fromRGBO(254, 37, 80, 1),
                tabs: [
                  Container(
                    width: 60,
                    child: const Tab(
                      text: "Women",
                    ),
                  ),
                  Container(
                    width: 60,
                    child: const Tab(
                      text: "Men",
                    ),
                  ),
                  Container(
                    width: 60,
                    child: const Tab(
                      text: "Childrens",
                    ),
                  ),
                ]),
          ),
          body: const SafeArea(
            child: TabBarView(
              children: [
                Women(),
                Men(),
                Children(),
              ],
            ),
          ),
        ));
  }
}
