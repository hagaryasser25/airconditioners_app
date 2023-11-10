import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SparesDetails extends StatefulWidget {
  String image;
  String name;
  String price;
  String details;
  SparesDetails({
    required this.image,
    required this.name,
    required this.price,
    required this.details,
  });

  @override
  State<SparesDetails> createState() => _SparesDetailsState();
}

class _SparesDetailsState extends State<SparesDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text('التفاصيل', style: TextStyle(color: Colors.white))),
            backgroundColor: Colors.blue,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('${widget.image}', height: 300.h),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('النوع : ${widget.name}',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10.w,
                    left: 10.w,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text('السعر : ${widget.price}',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10.w,
                    left: 10.w,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text('${widget.details}',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ),
                SizedBox(height: 50.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 40,
                  child: Container(
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        splashColor: Colors.blue,
                        onTap: () async {},
                        child: const Center(
                          child: Text(
                            "شراء",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 189, 214, 239),
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
    );
  }
}
