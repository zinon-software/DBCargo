import 'package:flutter/material.dart';

import '../utilities/themeColors.dart';
import '../utilities/themeStyles.dart';

class DropDown extends StatefulWidget {
  String dropDownValue;
  DropDown(this.dropDownValue);
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 16.0,
            color: Color.fromRGBO(168, 177, 198, 0.5),
            offset: Offset(9.0, 9.0),
          ),
          BoxShadow(
            blurRadius: 16.0,
            color: Color.fromRGBO(255, 255, 255, 0.5),
            offset: Offset(-9.0, -9.0),
          ),
        ],
      ),
      height: 30.0,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
        child: DropdownButton<String>(
          dropdownColor: ThemeColors.greenLight,
          value: widget.dropDownValue,
          icon: const Icon(
            Icons.arrow_downward_outlined,
            size: 12.0,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {
            setState(() {
              widget.dropDownValue = newValue!;
            });
          },
          items: <String>['First', 'Business', 'Economy']
              .map<DropdownMenuItem<String>>((String newValue) {
            return DropdownMenuItem<String>(
              value: newValue,
              child: Text(
                newValue,
                style: ThemeStyles.dropDownTextStyle,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
