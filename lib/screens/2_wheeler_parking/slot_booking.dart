import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slot_booking1/screens_packages.dart';

class TwoSlot extends StatelessWidget {
  const TwoSlot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'book_my_seat package example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BusLayout(),
    );
  }
}

class BusLayout extends StatefulWidget {
  const BusLayout({Key? key}) : super(key: key);

  @override
  State<BusLayout> createState() => _BusLayoutState();
}

class _BusLayoutState extends State<BusLayout> {
  static Future<Map<String, dynamic>> selectSeats(
      List<Map<String, dynamic>> selectedSeats) async {
    final response = await http.post(
      Uri.parse(
          'https://b94f-2401-4900-1cb0-7c75-71cb-efc7-8e8a-5fc2.ngrok-free.app/select-seats'),
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

  Set<SeatNumber> selectedSeats = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(
              (MediaQuery.of(context).size.width) * 0.1,
              (MediaQuery.of(context).size.height) * 0.1,
              (MediaQuery.of(context).size.width) * 0.07,
              (MediaQuery.of(context).size.height) * 0.1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text("parking entry"),
              const SizedBox(
                height: 32,
              ),
              Flexible(
                child: SizedBox(
                  width: double.maxFinite,
                  height: 500,
                  child: SeatLayoutWidget(
                    onSeatStateChanged: (rowI, colI, seatState) {
                      if (seatState == SeatState.selected) {
                        selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                      } else {
                        selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                      }
                    },
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
                  // selectSeats(selectedSeats.cast<Map<String, dynamic>>().toList());
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Razor_Pay()));
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
    return '[$rowI][$colI]';
  }
}