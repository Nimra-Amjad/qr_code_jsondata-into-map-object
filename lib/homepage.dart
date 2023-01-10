import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/appcolors.dart';
import 'package:qr_code_scanner/qr_model.dart';
import 'package:qr_code_scanner/simple_text.dart';
import 'package:qr_code_scanner/visitor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var getResult = 'QR Code Result';
  UserModel? dataQR;

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;
      setState(() {
        getResult = qrCode;
      });
      dataQR = userModelFromJson(getResult);

      print("QRCode_Result:--");
      print(dataQR!.name);
      print(getResult);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              scanQRCode();
            },
            child: Text('Scan QR'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: dataQR == null
                    ? Text("")
                    : Text(
                        dataQR!.name,
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
              ),
              SizedBox(
                height: 8,
              ),
              ListTile(
                title: Text(
                  "Cnic",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: dataQR == null
                    ? Text("")
                    : Text(
                        dataQR!.cnic,
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
              ),
              SizedBox(
                height: 8,
              ),
              ListTile(
                title: Text(
                  "Meetto",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: dataQR == null
                    ? Text("")
                    : Text(
                        dataQR!.meetto,
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
              ),
              SizedBox(
                height: 8,
              ),
              ListTile(
                title: Text(
                  "Meettime",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: dataQR == null
                    ? Text("")
                    : Text(
                        dataQR!.meettime,
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ],
          ),
          dataQR == null
              ? Text("")
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VisitorScreen(
                                  user: UserModel(
                                      name: dataQR!.name,
                                      cnic: dataQR!.cnic,
                                      meetto: dataQR!.meetto,
                                      meettime: dataQR!.meettime))));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: CustomText(
                          text: "Next Screen",
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          fontColor: AppColors.primaryBlack),
                    ),
                  ),
                )
        ],
      )),
    );
  }
}
