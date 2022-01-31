import 'package:bottom_nav_demo/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _homeController = Get.put(HomeController());

  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return PageView(
        pageSnapping: true,
        padEnds: true,
        children: [
          Pages(
            color: Colors.deepOrange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                    child: FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    ctrl.nextPage();
                  },
                )),
              ],
            ),
          ),
          Pages(
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.arrow_back_ios),
                  backgroundColor: Colors.red,
                  onPressed: () {
                    ctrl.previousPage();
                  },
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  backgroundColor: Colors.red,
                  onPressed: () {
                    ctrl.nextPage();
                  },
                ),
              ],
            ),
          ),
          Pages(
            color: Colors.blueGrey,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.arrow_back_ios),
                  backgroundColor: Colors.yellow,
                  onPressed: () {
                    ctrl.previousPage();
                  },
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  backgroundColor: Colors.yellow,
                  onPressed: () {
                    ctrl.nextPage();
                  },
                ),
              ],
            )),
          ),
          Pages(
            color: Colors.deepOrange,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  child: Text("1"),
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    ctrl.navigateToPage(0);
                  },
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_back_ios),
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    ctrl.previousPage();
                  },
                ),
              ],
            )),
          ),
        ],
        scrollDirection: Axis.horizontal,

        // reverse: true,
        physics: NeverScrollableScrollPhysics(),
        controller: ctrl.controller,
        onPageChanged: (num) {
          ctrl.updatePage(num);
        },
      );
    });
  }
}

class Pages extends StatelessWidget {
  Widget child;
  Color color;
  Pages({required this.child, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // widget(
            //   child: Text(
            //     text,
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //   ),
            child,
          ]),
    );
  }
}
