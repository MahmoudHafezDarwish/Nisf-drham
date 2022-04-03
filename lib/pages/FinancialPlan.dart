import 'package:drham/theme/colors.dart';
import 'package:flutter/material.dart';

import '../widget/snackbar.dart';

class FinancialPlanPage extends StatefulWidget {
  const FinancialPlanPage({Key key}) : super(key: key);

  @override
  _FinancialPlanPageState createState() => _FinancialPlanPageState();
}

class _FinancialPlanPageState extends State<FinancialPlanPage> {
  TextEditingController incomeEditingController;
  double incmoe = 0;
  double necesities = 0;
  double wants = 0;
  double saving = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    incomeEditingController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image(
          image: AssetImage('assets/images/plan.png'),
          width: 40,
          height: 40,
          fit: BoxFit.fill,
        ),
        title: Text(
          'Financial Paln',
          style: TextStyle(color: primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The 50/30/20 budget',
                style: TextStyle(
                  color: primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Find out how this budgeting approach applies to your money',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Add Monthly Income',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                // color: Colors.white,
                margin: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: incomeEditingController,
                  onChanged: (enterIncome){
                    setState(() {
                      print('incomeEditingController ${incomeEditingController.text}');
                      // incmoe = incomeEditingController.text as double;
                    });
                  },
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
                        style: BorderStyle.solid,
                        color: Theme.of(context).primaryColorLight,
                        // width: 0.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        style: BorderStyle.solid,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Your 50/30/20 budget',
                style: TextStyle(
                  color: primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'NECESSITIES',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  '${necesities}\$',
                  style: TextStyle(
                    color: primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'WANTS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  '${wants}\$',
                  style: TextStyle(
                    color: primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'SAVING AND DEPT REPAYMENT ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  '${saving}\$',
                  style: TextStyle(
                    color: primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50,),
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
                    "Get My Paln",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){
                    if (incomeEditingController.text == '') {
                      print("Income null");
                      setState(() {
                        CustomSnackBar(
                            actionTile: "close",
                            haserror: true,
                            isfloating: false,
                            onPressed: () {},
                            title: "Please enter your income!")
                            .show();
                      });
                    }else{
                      incmoe =incomeEditingController.text as double;

                      necesities = incmoe*0.5;
                      wants = incmoe*0.3;
                      saving = incmoe*0.2;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
