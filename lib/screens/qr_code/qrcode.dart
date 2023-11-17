import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:slot_booking1/constants/colors.dart';

class GenerateQrCodePage extends StatefulWidget {
  String? paymentId;
  GenerateQrCodePage({Key? key, this.paymentId}) : super(key: key);

  @override
  State<GenerateQrCodePage> createState() => _GenerateQrCodePageState();
}

class _GenerateQrCodePageState extends State<GenerateQrCodePage> {
  final qrText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.splashBgColor,
        title: const Text(
          'QR Code Generator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Generated QR Code",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                  textAlign: TextAlign.center),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                alignment: Alignment.center,
                child: SizedBox(
                  height: 250,
                  child: QrImageView(
                    backgroundColor: AppColors.white,
                    data: widget.paymentId!,
                  ),
                ),
              ),

              const Divider(
                height: 20.0,
                thickness: 1.0,
                color: AppColors.white,
                endIndent: 42.0,
                indent: 42.0,
              ),

              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: const Text(
                  "Scan this QR Code while entering the parking lot",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),

              // TextField(
              //   controller: qrText,
              //   decoration: const InputDecoration(
              //     hintText: "Enter your Data",
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(
              //           16.0,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 14.0,
              // ),
              // Container(
              //   padding: const EdgeInsets.only(left: 55.0, right: 55.0),
              //   height: 50.0,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       foregroundColor: Colors.black,
              //       backgroundColor: Colors.white,
              //       shape: RoundedRectangleBorder(
              //         side: const BorderSide(
              //           color: Colors.black,
              //           width: 1.0,
              //           style: BorderStyle.solid,
              //         ),
              //         borderRadius: BorderRadius.circular(
              //           32.0,
              //         ),
              //       ),
              //     ),
              //     onPressed: () {
              //       if (qrText.text.isEmpty) {
              //         setState(() {
              //           qrData = "https://www.github.com/kamranhccp";
              //           ScaffoldMessenger.of(context).showSnackBar(
              //             const SnackBar(
              //               content: Text(
              //                 "Please enter some Data!",
              //                 style: TextStyle(fontSize: 17.0),
              //               ),
              //             ),
              //           );
              //         });
              //       } else {
              //         setState(() {
              //           qrData = qrText.text;
              //         });
              //       }
              //     },
              //     child: const Text(
              //       "Generate QR Code",
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 30.0,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}