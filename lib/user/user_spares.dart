import 'package:airconditioners_app/auth/login_page.dart';
import 'package:airconditioners_app/user/spares_details.dart';
import 'package:airconditioners_app/user/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/products_model.dart';
import '../models/spares_model.dart';

class UserSpares extends StatefulWidget {
  static const routeName = '/userSpares';

  const UserSpares({super.key});

  @override
  State<UserSpares> createState() => _UserSparesState();
}

class _UserSparesState extends State<UserSpares> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            title: Center(
                child:
                    Text("قطع الغيار", style: TextStyle(color: Colors.white))),
            backgroundColor: Colors.blue,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: Column(children: [
            Image.asset('assets/images/home.jpg', width: 250),
            Text(
              'المنتجات المتاحة',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 15, left: 15, bottom: 10),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          '${products[index].image.toString()}',
                                          height: 200.h),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'النوع: ${products[index].name.toString()}',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Cairo'),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height: 40,
                                        child: Container(
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.transparent,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              splashColor: Colors.blue,
                                              onTap: () async {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return SparesDetails(
                                                    image:
                                                        '${products[index].image.toString()}',
                                                    name:
                                                        '${products[index].name.toString()}',
                                                    price:
                                                        '${products[index].price.toString()}',
                                                    details:
                                                        '${products[index].details.toString()}',
                                                  );
                                                }));
                                              },
                                              child: const Center(
                                                child: Text(
                                                  "التفاصيل",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: const LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        255, 189, 214, 239),
                                                    Colors.blue,
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

List<Spares> products = [
  Spares(
      name: "tornado",
      image: 'assets/images/11.jpg',
      price: "175 جنيه",
      details:
          "ريموت كنترول تكييف تورنيدو اسبليت استاندرد ، رمادي AC-R-REMOTCNTIN482"),
  Spares(
      name: "sharp",
      image: 'assets/images/22.jpg',
      price: '130 جنيه',
      details: "غطاء وحدة خارجية ، تكييف شارب اسبيلت 1.5 حصان ، أسود"),
  Spares(
      name: "value",
      image: 'assets/images/33.jpg',
      price: '200 جنيه',
      details: "طقم ساعة فريون VALUE R22"),
  Spares(
      name: "LG",
      image: 'assets/images/44.jpg',
      price: '575 جنيه',
      details: "كمبروسر مكيف روتاري 24 / LG")
];
