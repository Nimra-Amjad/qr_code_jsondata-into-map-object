import 'package:flutter/material.dart';
import 'package:qr_code_scanner/appcolors.dart';
import 'package:qr_code_scanner/rounded_back_button.dart';
import 'package:qr_code_scanner/simple_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:qr_code_scanner/qr_model.dart' as model;

class VisitorScreen extends StatefulWidget {
  final model.UserModel user;
  const VisitorScreen({super.key, required this.user});

  @override
  State<VisitorScreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<VisitorScreen> {
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _cniccontroller = TextEditingController();
  TextEditingController _meetoTocontroller = TextEditingController();
  TextEditingController _meetoTimeontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _usernamecontroller = TextEditingController(text: widget.user.name);
    _cniccontroller = TextEditingController(text: widget.user.cnic);
    _meetoTocontroller = TextEditingController(text: widget.user.meetto);
    _meetoTimeontroller = TextEditingController(text: widget.user.meettime);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernamecontroller.dispose();
    _cniccontroller.dispose();
    _meetoTocontroller.dispose();
    _meetoTimeontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppBar(color: Colors.white),
      backgroundColor: AppColors.backgroundBlue,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.sp, bottom: 18.sp),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: BackButtonRounded(
                      color: AppColors.primaryWhite,
                      iconcolor: AppColors.primaryBlack,
                      bordercolor: AppColors.primaryGrey,
                    ),
                  ),
                  CustomText(
                      text: "Visitor",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontColor: AppColors.primaryBlack),
                  const Icon(
                    Icons.abc,
                    color: Colors.transparent,
                  ),
                  const Icon(
                    Icons.abc,
                    color: Colors.transparent,
                  ),
                ],
              )),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: AppColors.primaryWhite),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 40.sp, left: 20.sp, right: 20.sp),
                  child: Column(
                    children: [
                      TextField(
                        controller: _usernamecontroller,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primarySkyBlue2),
                          ),
                          hintText: "Name",
                        ),
                      ),
                      SizedBox(
                        height: 28.sp,
                      ),
                      TextField(
                        controller: _cniccontroller,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primarySkyBlue2),
                          ),
                          hintText: "CNIC",
                        ),
                      ),
                      SizedBox(
                        height: 28.sp,
                      ),
                      TextField(
                        controller: _meetoTocontroller,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primarySkyBlue2),
                          ),
                          hintText: "Meeto To",
                        ),
                      ),
                      SizedBox(
                        height: 28.sp,
                      ),
                      TextField(
                        controller: _meetoTimeontroller,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primarySkyBlue2),
                          ),
                          hintText: "Meeto Time",
                        ),
                      ),
                      SizedBox(
                        height: 28.sp,
                      ),

                      // QrImage(
                      //   data: _dataString,
                      //   backgroundColor: Colors.white,
                      //   version: QrVersions.auto,
                      //   size: 300.0,
                      // ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          height: 33.sp,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                AppColors.gradientcolor1,
                                AppColors.gradientcolor2
                              ]),
                              borderRadius: BorderRadius.circular(10.sp),
                              color: AppColors.primaryGreenLight2),
                          child: Padding(
                            padding: EdgeInsets.only(left: 18.sp),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: "GENERATE QR",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          fontColor: AppColors.primaryBlack),
                                      CustomText(
                                          text: "VISITOR SMART PASS",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w200,
                                          fontColor: AppColors.primaryGrey),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
