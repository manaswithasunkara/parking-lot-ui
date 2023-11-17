import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slot_booking1/screens_packages.dart';


class TwoSlot extends StatefulWidget {
  const TwoSlot({Key? key}) : super(key: key);

  @override
  State<TwoSlot> createState() => _TwoSlotState();
}

class _TwoSlotState extends State<TwoSlot> {
  Set<SeatNumber> selectedSeats = {};
  String textParkingMessage ='';
  static const String selectedSeatKey = 'selectedSeats';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSelectedSeats();
  }



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




  Future <void> getSelectedSeats() async {
    final response = await http.get(Uri.parse('${Urls.url}/get-selected-seats'));
    if( response.statusCode==200){
      final jasonData= jsonDecode(response.body);
      final selectedSeatsData = jasonData['selected_seats'];
      for(final seatData in selectedSeatsData){
        final rowI = seatData['rowI'];
        final colI = seatData['colI'];
        final selectedSeat = SeatNumber(rowI: rowI, colI: colI);

      }
      setState(() {});
    }else{
      print('Error: ${response.statusCode}');
    }
  }



  Future<void> saveSelectedSeats() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(selectedSeatKey, selectedSeats.map((seat) => '${seat.rowI},${seat.colI}').toList(),);

  }



  Future<void> loadSelectedSeats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? selectedSeatsList = prefs.getStringList(selectedSeatKey);

    if(selectedSeatsList!= null){
      selectedSeats= selectedSeatsList.map((seat){
        List<String> parts = seat.split(',');
        return SeatNumber(rowI: int.parse(parts[0]), colI:int.parse(parts[1]));
      }).toSet().cast<SeatNumber>();
    }
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Two_Dashboards()));
          },
        ),
        title: const Text("Parking only"),
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
                child: SizedBox(
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
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Razor_Pay(amountController: 20,)));
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
    saveSelectedSeats();
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