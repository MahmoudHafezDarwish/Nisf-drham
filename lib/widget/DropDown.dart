import 'package:flutter/material.dart';

class IncomesDropDown extends StatefulWidget {
  const IncomesDropDown({Key key}) : super(key: key);

  @override
  _IncomesDropDownState createState() => _IncomesDropDownState();
}

class _IncomesDropDownState extends State<IncomesDropDown> {
  String dropdownValue = 'Freelancer platforms';

  List <String> spinnerItems = [
    'Freelancer platforms',
    'Salary',
    'Trading',
    'Social Media',
    'Others'
  ] ;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.red, fontSize: 18),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String data) {
        setState(() {
          dropdownValue = data;
        });
      },
      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
