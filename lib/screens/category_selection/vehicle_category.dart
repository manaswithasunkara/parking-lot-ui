import 'package:slot_booking1/screens_packages.dart';

class Vehicle_Category extends StatefulWidget {
  const Vehicle_Category({Key? key}) : super(key: key);

  @override
  State<Vehicle_Category> createState() => _Vehicle_CategoryState();
}

class _Vehicle_CategoryState extends State<Vehicle_Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBgColor,
      body: Column(
        children: [


          Container(
            margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.05,(MediaQuery.of(context).size.height)*0.2,(MediaQuery.of(context).size.width)*0.05, (MediaQuery.of(context).size.height)*0),
              child: Text('PLEASE SELECT YOUR VEHICLE CATEGORY',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800, color: AppColors.white),)),

          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.01, (MediaQuery.of(context).size.height)*0.1, (MediaQuery.of(context).size.width)*0.05, (MediaQuery.of(context).size.height*0.01)),
                child: Ink(
                  width: MediaQuery.of(context).size.width*0.45,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: InkWell(
                    onTap: (){

                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Two_Dashboards()));
                    },  
                    child: Ink.image(
                      image: const AssetImage(
                          'images/image-removebg-preview.png'),
                    ),
                  ),
                ),
              ),



              Container(
                margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.03, (MediaQuery.of(context).size.height)*0.1, (MediaQuery.of(context).size.width)*0.05, (MediaQuery.of(context).size.height*0.01)),
                child: Ink(
                  width: MediaQuery.of(context).size.width*0.39,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Four_Dasboards()));
                    },
                    child: Ink.image(
                      image: const AssetImage(
                          'images/snoopy-and-woodstock-riding-car-elie-widyastuti-transparent.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),





          Row(
            children: [

              Container(
                  margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.1, (MediaQuery.of(context).size.height)*0, (MediaQuery.of(context).size.width)*0.05, (MediaQuery.of(context).size.height*0.01)),
                  child: Text('2 Wheeler', style: TextStyle(fontSize:20, color: AppColors.white, fontWeight: FontWeight.w700),)),





              Container(
                  margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.27, (MediaQuery.of(context).size.height)*0, (MediaQuery.of(context).size.width)*0.05, (MediaQuery.of(context).size.height*0.01)),
                  child: Text('4 Wheeler', style: TextStyle(fontSize:20, color: AppColors.white, fontWeight: FontWeight.w700),))


            ],



          ),
        ],
      ),
    );
  }
}
