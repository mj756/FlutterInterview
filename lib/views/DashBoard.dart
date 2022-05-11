import 'package:flutter/material.dart';
import 'package:flutter_tech_round/controller/DashBoardController.dart';
import 'package:flutter_tech_round/views/category.dart';
import 'package:flutter_tech_round/views/home.dart';
import 'package:provider/provider.dart';
class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => DashBoardController(),
        builder: (context, child) {
          return Scaffold(
            body: SafeArea(
              child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                controller: context.watch<DashBoardController>().pageController,
                onPageChanged:
                context.read<DashBoardController>().changePageIndex,
                children: const <Widget>[
                  HomePage(),
                  Category()
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: IconButton(icon:const Icon(Icons.home), onPressed: () {
                    context.read<DashBoardController>().changePageIndex(0);
                  },),
                  label: 'Home',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Category',
                ),
              ],
              currentIndex: context.watch<DashBoardController>().currentPageIndex,
              selectedItemColor: Colors.blue[800],
              onTap: (value) {
                context.read<DashBoardController>().changePageIndex(value);
              },
            ),
          );
        });
  }
}
