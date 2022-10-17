import 'dart:math';

import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/17/22.
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.blue.withAlpha(400),
                  Colors.blue.withAlpha(800)
                ])),
          ),
          const Menu(),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0,end: value),
              duration: Duration(milliseconds: 500),
              builder: (_,double val,__){
                return(
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200*val)
                  ..rotateY((pi/6)*val),
                  child: Scaffold(
                    appBar: AppBar(

                      title: Text("3D drawer Menu"),
                      leading: IconButton(
                        onPressed: (){
                          setState(() {
                            if(value ==1) {
                              value = 0;
                            } else {
                              value = 1;
                            }
                          });
                        }, icon: const Icon(Icons.menu,color: Colors.red,),
                      ),
                    ),
                    body: Center(child: Text("Swipe Right top open the menu "),
                    ),
                    
                  ),
                )
                );
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e){
              if(e.delta.dx < 0) {
                setState(() {
                  if (value == 1) value = 0;
                });
              }
            },
            // onTap: (){
            //   setState(() {
            //     value ==0 ? value=1 : value = 0;
            //   });
            // },
          )
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "http://127.0.0.1:8080/api/file/zxxdetpzpoehh3v"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Youssoupha",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "Profil",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "settings",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
