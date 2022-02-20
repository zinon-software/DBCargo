import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/themeColors.dart';

class SortingDetails extends StatefulWidget {
  const SortingDetails({Key? key}) : super(key: key);

  @override
  _SortingDetailsState createState() => _SortingDetailsState();
}

class _SortingDetailsState extends State<SortingDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              // color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "DPCargo",
                style: GoogleFonts.overpass(fontSize: 30, color: Colors.black),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    left: 20.0,
                    child: Container(
                      height: 16.0,
                      width: 16.0,
                      decoration: BoxDecoration(
                        color: ThemeColors.orange,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10.0),
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20.0)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
