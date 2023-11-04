import '../screens_packages.dart';
import 'package:http/http.dart' as http;


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phonenumber= TextEditingController();
  TextEditingController name= TextEditingController();
  TextEditingController createpassword= TextEditingController();
  TextEditingController repeatpassword= TextEditingController();
  FocusNode efocus= FocusNode();
  FocusNode nfocus= FocusNode();
  FocusNode cpfocus= FocusNode();
  FocusNode rpfocus= FocusNode();
  final messageController = Get.put(MessageController());




  Future<void> register() async{
    final response = await http.post(Uri.parse('${Urls.url}/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

      body: jsonEncode(<String, String>{
        'name': name.text,
        'phonenumber': phonenumber.text,
        'password': createpassword.text
      })
    );

    String message= response.body;


    if(response.statusCode==201){
      setState(() {
        messageController.setMessage('User registered successfully',);
      });
    }

    else{
      setState(() {
        messageController.setMessage('Registration failed: $message');
      });
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:const BoxDecoration(
              image:DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.dst),
                  image: AssetImage('images/WhatsApp Image 2023-10-06 at 11.03.43_67e40216.jpg'))
          ),
          child: Column(
            children: <Widget>[
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
                // padding: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.05,   (MediaQuery.of(context).size.height)*0.25, (MediaQuery.of(context).size.width)*0.5, (MediaQuery.of(context).size.height)* 0.02),
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.08,   (MediaQuery.of(context).size.height)*0.03, (MediaQuery.of(context).size.width)*0.5, (MediaQuery.of(context).size.height)* 0.05),
                child: Text('Register',style: TextStyle(color: Colors.white,fontSize:25,fontWeight: FontWeight.w500),),
              ),
              Container(
                padding: const  EdgeInsets.fromLTRB(20,0,20,5),
                child: TextField(
                  controller: phonenumber,
                  focusNode: efocus,
                  onSubmitted: (val){
                    Focus.of(context).requestFocus(nfocus);
                  },
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter your Number',
                    labelStyle:TextStyle(color: efocus.hasFocus?Colors.white:Colors.white ,fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width:3,
                            color: Color(4278221184)
                        )
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:BorderSide(
                          width: 2,
                          color: Color(4278221184),
                        )
                    ),


                  ),

                ),
              ),






              Container(
                padding: const  EdgeInsets.fromLTRB(20,5,20,8),
                child: TextField(
                  controller: name,
                  focusNode: nfocus,
                  onSubmitted: (val){
                    Focus.of(context).requestFocus(cpfocus);
                  },
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your Name',
                    labelStyle:TextStyle(color: nfocus.hasFocus?Colors.white:Colors.white ,fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width:3,
                            color: Color(4278221184)
                        )
                    ),
                    focusedBorder:const OutlineInputBorder(
                        borderSide:BorderSide(
                          width: 2,
                          color: Color(4278221184),
                        )
                    ),


                  ),


                ),
              ),



              Container(
                padding: const  EdgeInsets.fromLTRB(20,5,20,8),
                child: TextField(
                  controller: createpassword,
                  focusNode: cpfocus,
                  onSubmitted: (val){
                    Focus.of(context).requestFocus(rpfocus);
                  },
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    labelText: 'Create Password',
                    hintText: 'Enter your Password',
                    labelStyle:TextStyle(color: efocus.hasFocus?Colors.white:Colors.white ,fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width:3,
                            color: Color(4278221184)
                        )
                    ),
                    focusedBorder:const OutlineInputBorder(
                        borderSide:BorderSide(
                          width: 2,
                          color: Color(4278221184),
                        )
                    ),


                  ),


                ),
              ),




              Container(
                padding: const  EdgeInsets.fromLTRB(20,9,20,5),
                child: TextField(
                  controller: repeatpassword,
                  focusNode: rpfocus,
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your Password again',
                    labelStyle:TextStyle(color: rpfocus.hasFocus?Colors.white:Colors.white ,fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width:3,
                            color: Color(4278221184)
                        )
                    ),
                    focusedBorder:const OutlineInputBorder(
                        borderSide:BorderSide(
                          width: 2,
                          color: Color(4278221184),
                        )
                    ),


                  ),


                ),
              ),

              Container(
                padding: const EdgeInsets.all(40),
                child: ElevatedButton(
                  onPressed: register,
                  style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.white),
                    shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )),

                  ),
                  child: Text('Register',style: TextStyle(color: AppColors.deepBlue, fontWeight: FontWeight.w700),),
                  ),

                ),



              const SizedBox(height: 16),
              Obx(() => Text(messageController.message.value,
              style: const TextStyle(color: Colors.white),
              )),

            ],
          ),
        ),
      ),
    );
  }
}