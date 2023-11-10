import 'package:airconditioners_app/auth/login_page.dart';
import 'package:airconditioners_app/user/user_details.dart';
import 'package:airconditioners_app/user/user_spares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/products_model.dart';

class UserHome extends StatefulWidget {
  static const routeName = '/userHome';

  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text('الصفحة الرئيسية',
                    style: TextStyle(color: Colors.white))),
            backgroundColor: Colors.blue,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                        Color.fromARGB(255, 189, 214, 239),
                        Colors.blue,
                      ])),
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          backgroundImage: AssetImage('assets/images/icon.jpg'),
                        ),
                      ),
                      Text("البريد الالكترونى",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text("الاسم",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text("رقم الهاتف",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () {
                            //  Navigator.push(context,
                            //      MaterialPageRoute(builder: (context) {
                            //    return UserList(
                            //      name: '${currentUser.fullName}',
                            //    );
                            //  }));
                          },
                          title: Text('مشترياتى'),
                          leading: Icon(Icons.shopping_bag),
                        ))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UserSpares();
                            }));
                          },
                          title: Text("قطع الغيار"),
                          leading: Icon(Icons.construction),
                        ))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () {
                            //  Navigator.push(context,
                            //      MaterialPageRoute(builder: (context) {
                            //    return UserList(
                            //      name: '${currentUser.fullName}',
                            //    );
                            //  }));
                          },
                          title: Text('ارسال شكوى'),
                          leading: Icon(Icons.report),
                        ))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () {
                            //Navigator.pushNamed(context, UserCart.routeName);
                          },
                          title: Text('سلة المشتريات'),
                          leading: Icon(Icons.shopping_cart),
                        ))),
                Divider(
                  thickness: 0.8,
                  color: Colors.grey,
                ),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('تأكيد'),
                                    content:
                                        Text('هل انت متأكد من تسجيل الخروج'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, UserLogin.routeName);
                                        },
                                        child: Text('نعم'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('لا'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          title: Text('تسجيل الخروج'),
                          leading: Icon(Icons.exit_to_app_rounded),
                        )))
              ],
            ),
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
                                          '${products[index].image.toString()}'),
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
                                                  return UserDetails(
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

List<Products> products = [
  Products(
      name: "fresh",
      image: 'assets/images/1.jpg',
      price: "16,225 جنيه",
      details:
          'تكييف سبليت بروفيشنال تربو بارد فقط من فريش، FUFW12C/IW، 1.5 حصان، ابيض'),
  Products(
      name: "sharp",
      image: 'assets/images/2.jpg',
      price: '20,200 جنيه',
      details:
          'تكييف شارب اسبليت 1.5 حصان بارد - ساخن ديجيتال، بلازما كلاستر، ابيض AY-AP12YHE'),
  Products(
      name: "tornado",
      image: 'assets/images/3.jpg',
      price: '19,089 جنيه',
      details:
          'تكييف سبليت 1.5 حصان انفرتر تبريد ديجيتال، بلازما شيلد من تورنيدو، ابيض TH-VX12ZEE'),
  Products(
      name: "sharp",
      image: 'assets/images/4.jpg',
      price: '35,793 جنيه',
      details:
          'تكييف سبليت ديجيتال بارد مع تقنية البلازما كلاستر من شارب AH-XP24UHE، 3 حصان - فضي')
];
