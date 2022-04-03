import 'package:drham/pages/tabBar/Income_entries.dart';
import 'package:drham/theme/colors.dart';
import 'package:flutter/material.dart';

import 'Epenses_entries.dart';

class EntriesScreen extends StatefulWidget {
  const EntriesScreen({Key key}) : super(key: key);

  @override
  _EntriesScreenState createState() => _EntriesScreenState();
}

class _EntriesScreenState extends State<EntriesScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedTab = 0;
  List<Widget> _list_screens = [IncomeEntries(), EntriesExpensive()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _list_screens.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTab = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entries'),
        bottom: TabBar(
          onTap: (int selectIndex) {},
          controller: _tabController,
          labelColor: primary,
          labelStyle: TextStyle(fontSize: 20),
          unselectedLabelStyle: TextStyle(fontSize: 16),
          unselectedLabelColor: Colors.black.withOpacity(0.5),
          indicatorColor: primary,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 4,
          tabs: [
            Tab(
              // icon: Image(
              //   image: AssetImage('assets/images/wallet.png'),
              //   width: 25,
              //   height: 25,
              // ),
              text: "Income",
            ),
            Tab(
              // icon:  Image(
              //   image: AssetImage('assets/images/shopping-bag.png'),
              //   width: 25,
              //   height: 25,
              // ),
              text: "Expensee",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          IncomeEntries(),
          EntriesExpensive(),
        ],
      ),
    );
  }
}
