import 'package:flutter/material.dart';

import '../pages/show_currancey/currency_picker.dart';
import '../theme/Style.dart';
import '../theme/colors.dart';
import 'income_inputbox.dart';

class IncomeCard extends StatefulWidget {
  TextEditingController income;

  // Function onSlectCurrancey;
  Function onAdd;
  Function removeLast;
  String selected_currancey = 'Dollar"\$\$"';

  IncomeCard({
    this.income,
    this.onAdd,
    this.removeLast
  });

  @override
  _IncomeCardState createState() => _IncomeCardState();
}

class _IncomeCardState extends State<IncomeCard> {
  String dropdownValue = 'Freelancer platforms';
  List<String> spinnerItems = [
    'Freelancer platforms',
    'Salary',
    'Trading',
    'Social Media',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              // backgroundImage: NetworkImage(snapshot.data["icon"]),
              backgroundImage:
              AssetImage('assets/images/app_logo.jpeg'),
            ),
            title:  Text(
              'Incomes',
              style: TextStyle(
                  color: Colors.grey[850], fontWeight: FontWeight.w500),
            ),
            // trailing: IconButton(
            //   onPressed: widget.removeLast,
            //   icon: Icon(Icons.remove_circle_outline,color: primary,),
            // ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'The money Tree',
                  style: TextStyle(
                      color: Colors.grey[850], fontWeight: FontWeight.w500),
                ),
              ),
              // Spacer(),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: primary, fontSize: 18),
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
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          inputBox(
            controller: widget.income,
            error: false,
            errorText: "",
            inuptformat: [],
            labelText: "Income",
            textInputType: TextInputType.number,
            obscureText: false,
            ispassword: false,
            istextarea: false,
            readonly: false,
            onchanged: (value) {
              setState(() {});
            },
          ),
          SizedBox(
            height: mainMargin,
          ),
          // ListTile(
          //   leading: CircleAvatar(
          //     backgroundColor: Colors.transparent,
          //     child: Icon(
          //       Icons.add,
          //       color: primary,
          //     ),
          //   ),
          //   title: Text("Add"),
          //   onTap:widget.onAdd,
          // )
        ],
      ),
    );
  }
}
