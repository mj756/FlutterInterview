import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/DashBoardController.dart';

class Category extends StatefulWidget
{
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

 @override
 void initState() {
    super.initState();
    Provider.of<DashBoardController>(context,listen: false).getCategoryApiData();
  }


  @override
  Widget build(BuildContext context) {
   return Container(
     child: ListView.builder(

    itemCount: context.watch<DashBoardController>().modelCategories!=null && context.watch<DashBoardController>().modelCategories!.categories.isNotEmpty ? 5:0,
    itemBuilder: (BuildContext context,int index){
      return  Container(
        height: 100,
        child: Row(
          children: [
            Container(
              width: 200,
              color: Colors.amber,
            ),
            Container(
              child: Text("image"),
            )
          ],
        ),
        );

    }

     ),
   );
  }
}