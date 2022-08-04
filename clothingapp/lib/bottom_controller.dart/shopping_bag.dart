import 'package:clothingapp/search_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({Key? key}) : super(key: key);

  @override
  State<ShoppingBag> createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 105.h,
          title: const Text(
            "Cart",
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
          actions: [
            GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SearchScreen())),
              child: Icon(
                Icons.search_outlined,
                color: Color(0xff212224),
              ),
            ),
            Image.asset('assets/images/avatar.png')
          ],
        ),
        body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('user-car-items')
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection('items')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Something is Wrong"),
                  );
                }
                return ListView.builder(
                    itemCount:
                        snapshot.data == null ? 0 : snapshot.data!.docs.length,
                    itemBuilder: (_, index) {
                      DocumentSnapshot _documentSnapshot =
                          snapshot.data!.docs[index];
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Image.network(_documentSnapshot['image']),
                          title: Text(_documentSnapshot['name']),
                          subtitle: Text(
                            "\$ ${_documentSnapshot['price'].toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          trailing: GestureDetector(
                            child: Icon(Icons.clear),
                            onTap: () {
                              FirebaseFirestore.instance
                                  .collection('user-car-items')
                                  .doc(FirebaseAuth.instance.currentUser!.email)
                                  .collection("items")
                                  .doc(_documentSnapshot.id)
                                  .delete();
                            },
                          ),
                        ),
                      );
                    });
              }),
        ));
  }
}
