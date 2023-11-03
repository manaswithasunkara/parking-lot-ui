import 'package:slot_booking1/screens/payment_gateway/razor_pay.dart';
import 'package:slot_booking1/screens_packages.dart';

class Two_Dashboards extends StatefulWidget {
  const Two_Dashboards({Key? key}) : super(key: key);

  @override
  State<Two_Dashboards> createState() => _Two_DashboardsState();
}

class _Two_DashboardsState extends State<Two_Dashboards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Container(
            margin: EdgeInsets.all(40),
            child: Text('2 Wheeler Parking', style: TextStyle(color: AppColors.deepBlue, fontSize: 25),),
          ),



          Container(
            margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.15, (MediaQuery.of(context).size.height)*0.05, (MediaQuery.of(context).size.width)*0.15, (MediaQuery.of(context).size.height)*0.05,),
            child: ElevatedButton(
              child: Row(
                children: [
                  Container(
                    // margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.15, (MediaQuery.of(context).size.height)*0.05, (MediaQuery.of(context).size.width)*0.15, (MediaQuery.of(context).size.height)*0.05,),
                    child: Text('[1] Sreyas Parking'),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.23, (MediaQuery.of(context).size.height)*0, (MediaQuery.of(context).size.width)*0, (MediaQuery.of(context).size.height)*0,),
                  child: Image.asset('location_logos/sreyas logo.png'),
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.11,

                  )
                ],
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Razor_Pay()));
              },
            ),

          )

        ],
      ),
    );
  }
}
