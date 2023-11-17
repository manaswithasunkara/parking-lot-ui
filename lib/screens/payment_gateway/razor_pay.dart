import 'package:qr_flutter/qr_flutter.dart';
import 'package:slot_booking1/screens_packages.dart';
import 'package:http/http.dart' as http;

class Razor_Pay extends StatefulWidget {

  Razor_Pay({Key? key} ) : super(key: key);

  @override
  State<Razor_Pay> createState() => _Razor_PayState();
}

class _Razor_PayState extends State<Razor_Pay> {
  Set<SeatNumber> selectedSeats = {};
  String textParkingMessage ='';
  late Razorpay _razorpay;
  TextEditingController amountController= TextEditingController();
  static Future<Map<String, dynamic>> selectSeats(
      List<Map<String, dynamic>> selectedSeats) async {
    final response = await http.post(
      Uri.parse(
          '${Urls.url}/select-seats'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'selected_seats': selectedSeats,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to select seats');
    }
  }

  static Future<Map<String, dynamic>> pay(int amount) async {
    final response = await http.post(
      Uri.parse('${Urls.url}/pay'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'amount': amount,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create Razorpay order');
    }
  }



  static Future<Map<String, dynamic>> paymentSuccess(Map<String, dynamic> response) async {
    final response = await http.post(
      Uri.parse('${Urls.url}/payment-success'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(response),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to handle payment success');
    }
  }




  static Future<Map<String, dynamic>> paymentError(Map<String, dynamic> response) async {
    final response = await http.post(
      Uri.parse('${Urls.url}/payment-error'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(response),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to handle payment error');
    }
  }


  static Future<Map<String, dynamic>> externalWallet(Map<String, dynamic> response) async {
    final response = await http.post(
      Uri.parse('${Urls.url}/external-wallet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(response),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to handle external wallet');
    }
  }






  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay= Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }



  void openCheckout(amountController){

    var options= {
      'key': 'rzp_test_QU92zSHk7fBUv1',
      'amount': int.parse(amountController.toString())*100,
      'name': 'Vehicle Slot Booking',
      'description': 'Please proceed to pay',
      'prefill': {'contact': '7780522133', 'email':'manaswitha.sunkara@gmail.com'},
      'external': {
        'wallets':['paytm']
      }

    };



    try{
      _razorpay.open(options);
    }

    catch(e){
      debugPrint('Error: $e');
    }
  }


  void handlePaymentSuccess(PaymentSuccessResponse response){
    debugPrint('Payment success: ${response.orderId},${response.signature},${response.paymentId}');
    var paymentId = response.paymentId;
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GenerateQrCodePage(paymentId: paymentId,)));
  }


  void handlePaymentError(PaymentFailureResponse response){

    debugPrint('Payment error: ${response.message}');
  }



  void handleExternalWallet( ExternalWalletResponse response){

    debugPrint('External Wallet: ${response.walletName}');
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.keyboard_arrow_left),
        //   onPressed: (){
        //     Navigator.push(context, MaterialPageRoute(builder: (context)=> Two_Dashboards()));
        //   },
        // ),
        title: const Text("Parking only"),
        centerTitle: true,
        backgroundColor: AppColors.splashBgColor,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(
              (MediaQuery.of(context).size.width) * 0.1,
              (MediaQuery.of(context).size.height) / 50,
              (MediaQuery.of(context).size.width) * 0.07,
              (MediaQuery.of(context).size.height) * 0.1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(textParkingMessage),
              SizedBox(height: 20,),
              Flexible(
                child: Container(
                  width: double.maxFinite,
                  height: 500,
                  child: SeatLayoutWidget(
                    onSeatStateChanged: _onSeatChanged,
                    stateModel: const SeatLayoutStateModel(
                      rows: 10,
                      cols: 7,
                      seatSvgSize: 45,
                      pathSelectedSeat: 'svg/seat_selected.svg',
                      pathDisabledSeat: 'svg/seat_disabled.svg',
                      pathSoldSeat: 'svg/seat_sold.svg',
                      pathUnSelectedSeat: 'svg/seat_unselected.svg',
                      currentSeatsState: [
                        [
                          SeatState.disabled,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                        ],
                        [
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(width: 2),
                        const Text('Disabled')
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          color: Colors.lightBlueAccent,
                        ),
                        const SizedBox(width: 2),
                        const Text('Sold')
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration:
                          BoxDecoration(border: Border.all(color: const Color(0xff0FFF50))),
                        ),
                        const SizedBox(width: 2),
                        const Text('Available')
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          color: const Color(0xff0FFF50),
                        ),
                        const SizedBox(width: 2),
                        const Text('Selected by you')
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  if(selectedSeats.isNotEmpty){
                    // selectSeats(selectedSeats.cast<Map<String, dynamic>>().toList());
                    List<Map<String, dynamic>> selectedList = selectedSeats.map((seats) =>
                    {
                      "rowI": seats.rowI, "colI": seats.colI
                    }).toList();
                    selectSeats(selectedList);
                    openCheckout(20);
                    debugPrint("checking the seat $selectedSeats, $selectedList");
                  }else{
                    Get.snackbar(snackPosition: SnackPosition.BOTTOM,'Error!', "Please select your slot", duration: const Duration(seconds: 3));
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.resolveWith((states) => const Color(0xFFfc4c4e)),
                ),
                child: const Text('Book Your Slot'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _onSeatChanged(rowI, colI, seatState) {
    if (seatState == SeatState.selected) {
      _updatedSeat(rowI, colI);
      selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
    } else {
      selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
    }
  }

  void _updatedSeat(rowI, colI){
    setState(() {
      textParkingMessage = "Your seat number is $rowI$colI per hour 20";
    });
  }
}

class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI && colI == other.colI;

  }

  @override
  int get hashCode => rowI.hashCode;

  @override
  String toString() {
    print('slot id $rowI, $colI');
    return '[$rowI][$colI]';
  }
}