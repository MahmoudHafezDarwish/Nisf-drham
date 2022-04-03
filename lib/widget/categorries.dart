import 'package:drham/Models/categories.dart';
import 'package:drham/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



// We need satefull widget for our categories

class CategoryListIetm extends StatefulWidget {
  @override
  _CategoryListIetmState createState() => _CategoryListIetmState();
}

class _CategoryListIetmState extends State<CategoryListIetm> {
  // By default our first item will be selected
  List<Categories> cat = CategoriesList;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cat.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        print('${cat[index].children.length}');
        // setState(() {
        //   selectedIndex = index;
        //   // Provider.of<AppProvider>(context).category = categories[index];
        // });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ExpansionTile(
                  leading: GestureDetector(
                    onTap: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) => EditCategoryDialog(
                      //       // category: snapshot,
                      //     ));
                    },
                    child: CircleAvatar(
                      // backgroundImage: NetworkImage(snapshot.data["icon"]),
                      backgroundImage:
                      AssetImage('assets/images/app_logo.jpeg'),
                    ),
                  ),
                  title: Text(
                    '${cat[index].category}',
                    style: TextStyle(
                        color: Colors.grey[850], fontWeight: FontWeight.w500),
                  ),
                  children: <Widget>[
                    Container(
                      height: 100,

                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: cat[index].children.length,
                        itemBuilder: (context, subindex) {
                          return Wrap(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    // margin: EdgeInsets.only(top: 16 / 4), //top padding 5
                                    // height: 2,
                                    // width: 30,
                                    // color: selectedIndex == index ? Colors.black : Colors.transparent,
                                    child: Icon(Icons.category),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    cat[index].children[subindex].category,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      // color: selectedIndex == index ? primary : Colors.grey,
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    )

                  ],
                ),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: <Widget>[
              //     Container(
              //       // margin: EdgeInsets.only(top: 16 / 4), //top padding 5
              //       // height: 2,
              //       // width: 30,
              //       // color: selectedIndex == index ? Colors.black : Colors.transparent,
              //       child: Icon(Icons.category),
              //     ),
              //     SizedBox(width: 5,),
              //     Text(
              //       cat[index].category,
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 16,
              //         // color: selectedIndex == index ? primary : Colors.grey,
              //       ),
              //     ),
              //
              //   ],
              // ),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
