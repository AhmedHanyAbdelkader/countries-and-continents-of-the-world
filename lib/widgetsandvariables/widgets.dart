import 'package:final_project/widgetsandvariables/variables.dart';
import 'package:flutter/material.dart';
import 'package:final_project/screens/country.dart';


Widget HomeList() {
  return ListView.builder(
    itemCount: continents.length,
    itemBuilder: (BuildContext context, index) {
      int i = index;
      return GestureDetector(
        child: Card(
            color: Colors.cyan[200],
            elevation: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    continents[index],
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Container(
                    // color: Colors.cyan,
                      alignment: Alignment.centerRight,
                      height: 60,
                      width: 50,
                      child: Image.asset(images[index])),
                ],
              ),
            )),
        onTap: () {
          int pointer = index + 1;
          switch (pointer) {
            case 1:
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Country('AF', 'Africa')));
              }
              break;
            case 2:
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Country('AN', 'Antarctica')));
              }
              break;
            case 3:
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Country('AS', 'Asia')));
              }
              break;
            case 4:
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Country('EU', 'Europe')));
              }
              break;
            case 5:
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Country('NA', 'North America')));
              }
              break;
            case 6:
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Country('OC', 'Oceania')));
              }
              break;
            case 7:
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Country('SA', 'South America')));
              }
              break;
            default:
              {
                print("This is default case");
              }
              break;
          }
        },
      );
    },
  );
}


Widget myFavoritePage() {
  return Center(
    child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1),
        itemCount: fav.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: Text('${fav[index]['name']}'),
            subtitle: Text('${fav[index]['capital']}'),
          );
        }),
  );
}


Widget myContainer(String name) {
  return Container(
    margin: EdgeInsets.all(20),
    height: 150,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Colors.cyan,
            Colors.cyanAccent,
            Colors.blue,
            Colors.blueAccent
            //add more colors for gradient
          ],
          begin: Alignment.topLeft, //begin of the gradient color
          end: Alignment.bottomRight, //end of the gradient color
          stops: [0, 0.2, 0.5, 0.8] //stops for individual color
        //set the stops number equal to numbers of color
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Center(
        child: Text(
          'this Country is called  $name',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
  );
}


Widget myRow(String z, String x) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$z',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Flexible(
            child: Text(
              '${x}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 1,
        child: Container(
          color: Colors.blue,
        ),
      )
    ],
  );
}

