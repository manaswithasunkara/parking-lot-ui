import 'screens_packages.dart';
import 'package:http/http.dart' as http;

class MessageController extends GetxController {
  var message = ''.obs;

  void setMessage(String newMessage) {
    message.value = newMessage;
  }
}



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {





TextEditingController phonenumberController= TextEditingController();
TextEditingController passwordController= TextEditingController();
FocusNode ufocus= FocusNode();
FocusNode pfocus= FocusNode();
final messageController = Get.put(MessageController());


Future<void> login() async{
  final response= await http.post(Uri.parse('https://63f4-103-22-173-38.ngrok-free.app/login'),
    headers: <String, String>{
    'Content-Type' : 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,String>{
      'phonenumber':phonenumberController.text,
      'password':passwordController.text
    })
  );
  String message= response.body;

  if (response.statusCode==200){
    setState(() {
      messageController.setMessage('Login Successful');
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Vehicle_Category()));

    });
  }

  else{
    setState(() {
      messageController.setMessage('Login failed: $message');
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height,MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('images/WhatsApp Image 2023-10-06 at 11.03.43_67e40216.jpg'),
              fit: BoxFit.cover
            ),
          ),
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Column(
            children: [


              Container(
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.3, (MediaQuery.of(context).size.width)*0.35, (MediaQuery.of(context).size.height)*0.15, (MediaQuery.of(context).size.width)*0.15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(image: AssetImage('images/temp login.png')),
                    borderRadius: BorderRadius.circular(80)
                ),
                height: MediaQuery.of(context).size.height*0.15,
                width: MediaQuery.of(context).size.width*0.3,

              ),


              
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.08,   (MediaQuery.of(context).size.height)*0.1, (MediaQuery.of(context).size.width)*0.5, (MediaQuery.of(context).size.height)* 0.03),
                // height: MediaQuery.of(context).size.height*0.1,
                child: Text('SIGN IN',style: TextStyle(color:Colors.white,fontSize:20,fontWeight: FontWeight.w500),),
              ),




              Container(
                // padding: const  EdgeInsets.fromLTRB(20,35,30,0),
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.02,(MediaQuery.of(context).size.height)*0,(MediaQuery.of(context).size.width)*0.08, (MediaQuery.of(context).size.height)*0.02),
                height: (MediaQuery.of(context).size.height)*0.1,
                width: (MediaQuery.of(context).size.width)*0.78,
                child: TextField(
                  focusNode: ufocus,
                  controller: phonenumberController,
                  onSubmitted: (val){
                    Focus.of(context).requestFocus(pfocus);
                  },
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: ufocus.hasFocus ? Colors.white : Colors.transparent,
                      labelText: 'Phone Number',
                      hintText: 'Enter Your Number',
                      hintStyle: const TextStyle(color:Colors.white),
                      labelStyle:TextStyle(color: ufocus.hasFocus?Colors.white: Colors.white ,fontWeight: FontWeight.w400),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width:3,
                            color: Colors.white,
                          )
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderSide:BorderSide(
                            width: 2,
                            color: Colors.white,
                          )
                      )


                  ),

                ),
              ),




              Container(
                // padding: const  EdgeInsets.fromLTRB(20,10,30,0),
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.02,(MediaQuery.of(context).size.height)*0,(MediaQuery.of(context).size.width)*0.08, (MediaQuery.of(context).size.height)*0.02),
                height: (MediaQuery.of(context).size.height)*0.1,
                width: (MediaQuery.of(context).size.width)*0.78,
                child: TextField(
                  focusNode: pfocus,
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),

                  decoration: InputDecoration(
                    //   filled: true,
                    // fillColor: pfocus.hasFocus ? Colors.transparent:Colors.white,

                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color:pfocus.hasFocus?Colors.white:Colors.white, fontWeight: FontWeight.w400),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.white,

                          )
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:BorderSide(
                            width: 2,
                            color: Colors.white,
                          )
                      )
                  ),

                ),
              ),





              Container(
                margin: const EdgeInsets.all(30),
                child: TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Register()));
                },child: Text('Don\'t have an account? Click here',
                  style:TextStyle(color:Colors.white, fontSize: 18) ,),),
              ),






              ElevatedButton(
                onPressed: login,

                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  )),
                ),
                child: Text('Login',style: TextStyle(color: AppColors.deepBlue, fontWeight: FontWeight.w700),),
              ),



              const SizedBox(height: 16),
              Obx(() => Text(messageController.message.value,
              style: const TextStyle(
                color: Colors.white
              ),
              )),


            ],
          ),
        ),
      ),
    );
  }
}
