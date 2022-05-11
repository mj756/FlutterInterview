import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tech_round/controller/DashBoardController.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 @override
 void initState() {
    super.initState();
   // Provider.of<DashBoardController>(context,listen: false).getApiData();
    //get data from api
  }

  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
        future: Provider.of<DashBoardController>(context,listen: false).getApiData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
            {

              return const Center(child: CircularProgressIndicator());
            }else if(snapshot.hasError)
              {
                return const Center(child: CircularProgressIndicator());
              }
          else {
            print(json.encode(context.watch<DashBoardController>().top));

              return Container(
            height: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: context
                    .watch<DashBoardController>()
                    .top != null && context
                    .watch<DashBoardController>()
                    .top
                    .mainStickyMenu
                    .isNotEmpty ? context
                    .watch<DashBoardController>()
                    .top
                    .mainStickyMenu
                    .length : 0,
                separatorBuilder: (BuildContext context,
                    int index) => const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  print(index);
                  print(context
                      .watch<DashBoardController>()
                      .top
                      .mainStickyMenu[index].image);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        color: Colors.amber,
                        child: Image.network(context
                            .watch<DashBoardController>()
                            .top
                            .mainStickyMenu[index].image),
                      ),
                      Container(
                        child: Text(context
                            .watch<DashBoardController>()
                            .top
                            .mainStickyMenu[index].title),
                      )
                    ],
                  );
                }

            ),
          );
            }
        }
      );
  }
}
