import 'dart:developer';

import 'package:e_commerce/utills/product_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cat = "All";

  @override
  void initState() {
    super.initState();
    AllCategory.insert(0, "All");
    log("${category}");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: h * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...AllCategory.map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            cat = e;
                          });
                        },
                        child: Container(
                          height: h * 0.035,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              color: (cat == e)
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2,
                            )),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            e.toString().replaceFirst(
                                e[0], e[0].toString().toUpperCase()),
                            style: TextStyle(
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w500,
                              color: (cat == e)
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.5),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ).toList(),
                  ],
                ),
              ),
              Container(
                height: h * 0.45,
                width: w * 0.7,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(w * 0.05),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://t4.ftcdn.net/jpg/05/74/86/57/360_F_574865745_WmtTXdOTGLsgua58GuKR1c4hFU2yxryT.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h * 0.025,
                    ),
                 const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       "Red Chair",
                       style: TextStyle(
                         fontSize: 35,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ),
                     ),
                     Icon(Icons.favorite,color: Colors.white,),
                   ],
                 ),
                    Text(
                      "Red Chair",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
