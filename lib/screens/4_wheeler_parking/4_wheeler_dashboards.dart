import 'package:slot_booking1/screens/4_wheeler_parking/slot_booking4.dart';
import 'package:slot_booking1/screens_packages.dart';

class Four_Dasboards extends StatefulWidget {
  const Four_Dasboards({Key? key}) : super(key: key);

  @override
  State<Four_Dasboards> createState() => _Four_DasboardsState();
}

class _Four_DasboardsState extends State<Four_Dasboards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('4 wheeler Dashboards'),

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
                    margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width)*0.25, (MediaQuery.of(context).size.height)*0, (MediaQuery.of(context).size.width)*0, (MediaQuery.of(context).size.height)*0,),
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.11,
                    child: Image.asset('location_logos/sreyas logo.png'),

                  )
                ],
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FourSlot()));
              },
            ),

          )

        ],
      ),

    );
  }
}

