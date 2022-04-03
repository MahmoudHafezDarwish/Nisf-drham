import 'package:currency_picker/currency_picker.dart';
import 'package:drham/theme/colors.dart';
import 'package:drham/widget/categorries.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../Models/categories.dart';

class EntriesExpensive extends StatefulWidget {
  const EntriesExpensive({Key key, this.addNewTransaction}) : super(key: key);
  final Function addNewTransaction;

  @override
  _EntriesExpensiveState createState() => _EntriesExpensiveState();
}

class _EntriesExpensiveState extends State<EntriesExpensive> {
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String category = "Shopping";
  String sup_category = "Shopping";
  bool expenseSelected = true;
  bool incomeSelected = false;
  String selected_currancey = 'Dollar"\$\$"';
  String dropdownValue = 'Daily';

  List<String> spinnerItems = [
    'Yearly',
    'Monthly',
    'Daily',
    'Custom'
  ];
  int selectedIndex = 0;
  DateTime date;
  Categories selected_categories;
  List<Categories> subCategories;

  void _submitTransaction() {
    double expense = double.tryParse(amountController.text) ?? 0.00;
    String note = noteController.text;

    if (incomeSelected) {
      category = "Income";
    }
    if (expense <= 0.00 ||
        amountController.text.isEmpty ||
        date == null ||
        note.isEmpty) {
      return;
    }
    widget.addNewTransaction(category, expense, note, date);
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subCategories = [
      Categories(category: 'Clothing'),
      Categories(category: 'Shoes'),
      Categories(category: 'Other supplies'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xfff5f5f5),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        padding: EdgeInsets.only(
            left: 20.0,
            top: 30.0,
            right: 20.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  "Add New Expense",
                  style: TextStyle(
                    color: primary,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5,),
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
            const SizedBox(
              height: 20.0,
            ),
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
                            borderRadius: BorderRadius.circular(10),
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
            const SizedBox(
              height: 20.0,
            ),
            // ToggleSwitch(
            //   totalSwitches: 2,
            //   labels: const [
            //     "Expense",
            //     "Income",
            //   ],
            //   minWidth: 150,
            //   minHeight: 60,
            //   cornerRadius: 30.0,
            //   activeBgColor: const [
            //     Colors.deepOrange,
            //   ],
            //   initialLabelIndex: selectedIndex,
            //   activeFgColor: Colors.white,
            //   inactiveBgColor: Colors.white,
            //   inactiveFgColor: Colors.black54,
            //   fontSize: 20,
            //   changeOnTap: false,
            //   onToggle: (index) {
            //     selectedIndex = index;
            //     setState(() {
            //       if (selectedIndex == 1) {
            //         expenseSelected = false;
            //         incomeSelected = true;
            //         return;
            //       }
            //       if (selectedIndex == 0) {
            //         expenseSelected = true;
            //         incomeSelected = false;
            //         return;
            //       }
            //     });
            //   },
            // ),

            Container(
              // color: Colors.white,
              margin: const EdgeInsets.all(20.0),
              child: TextField(
                controller: amountController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: primary,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  label: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "\$ 0.00",
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: const TextStyle(
                    color: primary,
                    fontSize: 30.0,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                  ),
                  hintText: "Eg.\$400",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                      color: Theme.of(context).primaryColorLight,
                      // width: 0.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            //Categories
            GestureDetector(
              onTap: () {
                showCategoriesBottomSheet();
              },
              child: Container(
                height: 60.0,
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0),
                    const Icon(
                      Icons.category_outlined,
                      size: 25.0,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 20.0),
                    Text(
                      'Selected Category',
                      style: TextStyle(
                          fontSize: 16,
                          color: primary,
                          fontWeight: FontWeight.bold),
                    )
                    // DropdownButton(
                    //   icon: const Icon(Icons.arrow_drop_down),
                    //   iconSize: 30.0,
                    //   value: category,
                    //   style: const TextStyle(
                    //     color: Colors.black54,
                    //     fontSize: 20.0,
                    //   ),
                    //   onChanged: (String newValue) {
                    //     setState(() {
                    //       category = newValue;
                    //     });
                    //   },
                    //   items: CategoriesList.map<DropdownMenuItem<String>>((value) {
                    //     setState(() {
                    //       selected_categories = value;
                    //       // subCategories = value.children.toList();
                    //     });
                    //     return DropdownMenuItem(child: Text(value.category), value: value.category);
                    //   }).toList(),
                    // ),
                  ],
                ),
              ),
            ),
            // Container(
            //   height: 60.0,
            //   margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            //   child: Row(
            //     children: [
            //       const SizedBox(width: 20.0),
            //       const Icon(
            //         Icons.category_outlined,
            //         size: 25.0,
            //         color: Colors.black54,
            //       ),
            //       const SizedBox(width: 20.0),
            //       DropdownButton(
            //         icon: const Icon(Icons.arrow_drop_down),
            //         iconSize: 30.0,
            //         value: sup_category,
            //         style: const TextStyle(
            //           color: Colors.black54,
            //           fontSize: 20.0,
            //         ),
            //         onChanged: (String newValue) {
            //           setState(() {
            //             sup_category = newValue;
            //           });
            //         },
            //         items: CategoriesList.map<DropdownMenuItem<String>>((value) {
            //           return DropdownMenuItem(child: Text(value.category), value: value.category);
            //         }).toList(),
            //       ),
            //     ],
            //   ),
            // ),

            Container(
              height: 60.0,
              margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20.0),
                  const Icon(Icons.note_add),
                  const SizedBox(width: 20.0),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 200,
                    child: TextField(
                      controller: noteController,
                      decoration: const InputDecoration(
                        hintText: "Add Note",
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime(2022, 01, 01),
                  firstDate: DateTime(2022, 01, 01),
                  lastDate: DateTime(2022, 12, 31),
                ).then((newDate) {
                  setState(() {
                    date = newDate;
                  });
                });
              },
              child: Container(
                height: 60.0,
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0),
                    const Icon(
                      Icons.calendar_today,
                      size: 25.0,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      // date != null
                      //     ? DateFormat.yMd().format(date)
                      //     :
                      "Pick the date",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                child: const Text(
                  "Add Expense",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _submitTransaction,
              ),
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   height: 60.0,
    //   margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(10.0),
    //   ),
    //   child: Row(
    //     children: [
    //       const SizedBox(width: 20.0),
    //       const Icon(
    //         Icons.category_outlined,
    //         size: 25.0,
    //         color: Colors.black54,
    //       ),
    //       const SizedBox(width: 20.0),
    //       DropdownButton(
    //         icon: const Icon(Icons.arrow_drop_down),
    //         iconSize: 30.0,
    //         value: category,
    //         style: const TextStyle(
    //           color: Colors.black54,
    //           fontSize: 20.0,
    //         ),
    //         onChanged: (String newValue) {
    //           setState(() {
    //             category = newValue;
    //           });
    //         },
    //         items: categories.map<DropdownMenuItem<String>>((value) {
    //           return DropdownMenuItem(child: Text(value), value: value);
    //         }).toList(),
    //       ),
    //     ],
    //   ),
    // );
  }

  void showCategoriesBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        elevation: 0,
        isDismissible: true,
        builder: (context) {
          return Container(
            margin: EdgeInsets.all(10),
            child: BottomSheet(
                elevation: 3,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.5),
                    )),
                onClosing: () {},
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    // height: 120,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              height: 7,
                              width: 30,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius:BorderRadius.circular(30) ,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                // style: TextButton.styleFrom(
                                //   primary: Colors.black,
                                //   side: BorderSide(width: 2, color: Colors.grey),
                                // ),
                                icon: Icon(Icons.category_outlined),
                              ),
                              Text(
                                "Choose Category",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                          CategoryListIetm(),

                          /*
                            ListTile(
                            leading: Icon(
                            Icons.language,
                            color: Colors.red,
                            ),
                            title: Text('Arabic'),
                            onTap: (){
                              showLanguageBottomSheet();
                            },
                            trailing: Icon(
                              Icons.check_circle_outline_sharp,
                              size: 14,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            title: Text('English'),
                            trailing: Icon(
                              Icons.check,
                              size: 14,
                            ),
                          ),
                          */
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
