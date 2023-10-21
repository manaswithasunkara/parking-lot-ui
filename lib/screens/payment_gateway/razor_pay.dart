import 'package:slot_booking1/screens_packages.dart';
import 'package:http/http.dart' as http;

class Razor_Pay extends StatefulWidget {
  const Razor_Pay({Key? key}) : super(key: key);

  @override
  State<Razor_Pay> createState() => _Razor_PayState();
}

class _Razor_PayState extends State<Razor_Pay> {

  late Razorpay _razorpay;
  TextEditingController _amountController= TextEditingController();


  static Future<Map<String, dynamic>> pay(int amount) async {
    final response = await http.post(
      Uri.parse('https://63f4-103-22-173-38.ngrok-free.app/pay'),
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
      Uri.parse('https://ae5a-103-22-173-38.ngrok-free.app/payment-success'),
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
      Uri.parse('https://ae5a-103-22-173-38.ngrok-free.app/payment-error'),
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
      Uri.parse('https://ae5a-103-22-173-38.ngrok-free.app/external-wallet'),
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



  void openCheckout(){

    var options= {
      'key': 'rzp_test_QU92zSHk7fBUv1',
      'amount': int.parse(_amountController.text)*100,
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
    debugPrint('Payment success: ${response.paymentId}');
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
        title: Text('Razorpay Integration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter the amount:'),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: openCheckout,
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
