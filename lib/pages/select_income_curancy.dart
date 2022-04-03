import 'package:currency_picker/currency_picker.dart';
import 'package:drham/widget/income_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/Style.dart';
import '../theme/colors.dart';
import '../widget/income_inputbox.dart';

class Currency extends StatefulWidget {
  const Currency({Key key}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  TextEditingController income;
  TextEditingController income2;
  // String controllertext;
  // int counter = 1 ;
  String dropdownValue = 'Freelancer platforms';
  String selected_currancey = 'Dollar"\$\$"';
  List<Widget> _cardList =[];
  Map<String, TextEditingController> allControllers ;
  List<String> spinnerItems = [
    'Freelancer platforms',
    'Salary',
    'Trading',
    'Social Media',
    'Others'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    income = TextEditingController();
    income2 = TextEditingController();
    _cardList =  [
      IncomeCard(
        income: income,
      ),
      // IncomeCard(
      //   income: income2,
      // )
    ];
    allControllers = <String, TextEditingController>{
      "controller1": income,
    };

    // _cardList.add(IncomeCard(
    //   income: income,
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Enter income',style: TextStyle(color: Colors.black),)),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add your income ",
                style: TextStyle(
                    color: primary, fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: mainMargin,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Center(
                        child: Wrap(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: secondary,
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        showCurrencyPicker(
                                          context: context,
                                          showFlag: true,
                                          showCurrencyName: true,
                                          showCurrencyCode: true,
                                          onSelect: (currency) {
                                            setState(() {
                                              selected_currancey =
                                                  currency.name + " " + currency.symbol;
                                            });
                                            // print(
                                            //     'Select currency: ${currency.name}');
                                          },
                                          favorite: ['SEK'],
                                        );
                                      },
                                      child: const Text(
                                        'Select currency picker',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                                // Spacer(),
                                Text(
                                  "${selected_currancey}",
                                  style: TextStyle(
                                      color: primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ..._cardList
                    // IncomeCard(
                    //   income: income,
                    // ),
                    // IncomeCard(
                    //   income: income2,
                    // ),
                    // Expanded(
                    //   child: ListView.builder(
                    //       itemCount: _cardList.length,
                    //       itemBuilder: (context, index) {
                    //         return _cardList[index];
                    //       }),
                    // ),
                  ],
                ),
                // child: Card(
                //   child: ExpansionTile(
                //     leading: GestureDetector(
                //       onTap: () {
                //         // showDialog(
                //         //     context: context,
                //         //     builder: (context) => EditCategoryDialog(
                //         //       // category: snapshot,
                //         //     ));
                //       },
                //       child: CircleAvatar(
                //         // backgroundImage: NetworkImage(snapshot.data["icon"]),
                //         backgroundImage:
                //             AssetImage('assets/images/app_logo.jpeg'),
                //       ),
                //     ),
                //     title: Text(
                //       'Incomes',
                //       style: TextStyle(
                //           color: Colors.grey[850], fontWeight: FontWeight.w500),
                //     ),
                //     children: <Widget>[
                //
                //
                //       // Column(
                //       //   children: [
                //       //     Row(
                //       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       //       children: [
                //       //         Padding(
                //       //           padding: const EdgeInsets.only(left: 8.0),
                //       //           child: Text(
                //       //             'The money Tree',
                //       //             style: TextStyle(
                //       //                 color: Colors.grey[850],
                //       //                 fontWeight: FontWeight.w500),
                //       //           ),
                //       //         ),
                //       //         // Spacer(),
                //       //         DropdownButton<String>(
                //       //           value: dropdownValue,
                //       //           icon: Icon(Icons.arrow_drop_down),
                //       //           iconSize: 24,
                //       //           elevation: 16,
                //       //           style: TextStyle(color: primary, fontSize: 18),
                //       //           underline: Container(
                //       //             height: 2,
                //       //             color: Colors.deepPurpleAccent,
                //       //           ),
                //       //           onChanged: (String data) {
                //       //             setState(() {
                //       //               dropdownValue = data;
                //       //             });
                //       //           },
                //       //           items: spinnerItems
                //       //               .map<DropdownMenuItem<String>>(
                //       //                   (String value) {
                //       //             return DropdownMenuItem<String>(
                //       //               value: value,
                //       //               child: Text(value),
                //       //             );
                //       //           }).toList(),
                //       //         )
                //       //       ],
                //       //     ),
                //       //     SizedBox(
                //       //       height: 20,
                //       //     ),
                //       //     inputBox(
                //       //       controller: income,
                //       //       error: false,
                //       //       errorText: "",
                //       //       inuptformat: [],
                //       //       labelText: "Income",
                //       //       textInputType: TextInputType.number,
                //       //       obscureText: false,
                //       //       ispassword: false,
                //       //       istextarea: false,
                //       //       readonly: false,
                //       //       onchanged: (value) {
                //       //         setState(() {
                //       //           print("income value : $value");
                //       //         });
                //       //       },
                //       //     ),
                //       //     SizedBox(
                //       //       height: mainMargin,
                //       //     ),
                //       //     Padding(
                //       //       padding: const EdgeInsets.only(left: 8.0, right: 8),
                //       //       child: Center(
                //       //         child: Wrap(
                //       //           children: [
                //       //             Row(
                //       //               mainAxisAlignment:
                //       //               MainAxisAlignment.spaceBetween,
                //       //               children: [
                //       //                 Container(
                //       //                   height: 60,
                //       //                   width: 150,
                //       //                   decoration: BoxDecoration(
                //       //                     borderRadius: BorderRadius.circular(15),
                //       //                     color: secondary,
                //       //                   ),
                //       //                   child: Center(
                //       //                     child: InkWell(
                //       //                       onTap: () {
                //       //                         showCurrencyPicker(
                //       //                           context: context,
                //       //                           showFlag: true,
                //       //                           showCurrencyName: true,
                //       //                           showCurrencyCode: true,
                //       //                           onSelect: (currency) {
                //       //                             setState(() {
                //       //                               selected_currancey = currency.name+" "+currency.symbol ;
                //       //                             });
                //       //                             // print(
                //       //                             //     'Select currency: ${currency.name}');
                //       //                           },
                //       //                           favorite: ['SEK'],
                //       //                         );
                //       //                       },
                //       //                       child: const Text(
                //       //                         'Select currency picker',
                //       //                         style: TextStyle(
                //       //                             color: Colors.white,
                //       //                             fontWeight: FontWeight.bold,
                //       //                             fontSize: 14
                //       //                         ),
                //       //                       ),
                //       //                     ),
                //       //                   ),
                //       //                 ),
                //       //                 // Spacer(),
                //       //                 Text(
                //       //                   "${selected_currancey}",
                //       //                   style: TextStyle(
                //       //                       color: primary,
                //       //                       fontWeight: FontWeight.bold,
                //       //                       fontSize: 16),
                //       //                 ),
                //       //               ],
                //       //             ),
                //       //           ],
                //       //
                //       //
                //       //         ),
                //       //       ),
                //       //     ),
                //       //     ListTile(
                //       //       leading: CircleAvatar(
                //       //         backgroundColor: Colors.transparent,
                //       //         child: Icon(
                //       //           Icons.add,
                //       //           color: primary,
                //       //         ),
                //       //       ),
                //       //       title: Text("Add"),
                //       //       onTap: () {
                //       //
                //       //         // Navigator.of(context).push(MaterialPageRoute(
                //       //         //     builder: (context) => ProductPage()));
                //       //       },
                //       //     )
                //       //   ],
                //       // ),
                //     ],
                //   ),
                // ),
              ),

              // Spacer(),
              InkWell(
                key: ValueKey('Get started button'),
                onTap: () {},
                child: Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: primary,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(Icons.arrow_forward_rounded, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          onAdd();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Function onAdd() {
    // counter++;
    // controllertext = controllertext+"$counter";
    TextEditingController controller1 = TextEditingController();
    // allControllers.put('controller1',controller1);
    _cardList.add(IncomeCard(
      income: income,
      // removeLast:remove() ,
      // onAdd: onAdd(),
    ));
    setState(() {

    });
  }
  //
  // Function remove(){
  //   // _cardList.removeAt(index);
  //   _cardList.removeLast();
  // }

}
