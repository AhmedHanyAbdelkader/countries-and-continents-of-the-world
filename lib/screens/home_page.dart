import 'package:final_project/widgetsandvariables/widgets.dart';
import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../data/data.dart';
import 'package:final_project/widgetsandvariables/variables.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var jsonData = Data();
  void loadData() async {
    await jsonData.getContinents();
    await jsonData.getCountries('');
    setState(() {
      continents = jsonData.continents;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DSC World'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SalomonBottomBar(
          currentIndex: currentIndex,
          onTap: (i) {
            setState(() {
              currentIndex = i;
              //  print(_continents);
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.cyan,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Favorites"),
              selectedColor: Colors.cyan,
            ),
          ],
        ),
      ),
      body: currentIndex == 0 ? HomeList() : myFavoritePage(),
      drawer: MyDrawer(),
    );
  }

  Widget MyDrawer() {
    return Drawer(
      elevation: 20,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/images/worldmapnight.jpg',
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/mypic.jpg'),
                radius: 68,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Change App Mode'),
                  SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                      icon: Icon(isLight
                          ? Icons.brightness_2
                          : Icons.brightness_2_outlined),
                      onPressed: () {
                        setState(() {
                          if (isLight == false) {
                            ThemeManager.of(context).setBrightnessPreference(
                                BrightnessPreference.dark);
                          } else {
                            ThemeManager.of(context).setBrightnessPreference(
                                BrightnessPreference.light);
                          }
                        });
                        isLight = !isLight;
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}
