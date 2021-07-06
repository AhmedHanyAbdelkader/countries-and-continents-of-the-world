import 'package:flutter/material.dart';
import '../data/data.dart';
import 'details_page.dart';
import 'package:final_project/widgetsandvariables/variables.dart';


class Country extends StatefulWidget {
  String p, w;
  Country(this.p, this.w);
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  TextEditingController controller = new TextEditingController();

  List _countries = [];
  var jsonData = Data();
  void loadData() async {
    await jsonData.getCountries(widget.p);
    setState(() {
      _countries = jsonData.f;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void Filter(value) {
    List results = [];
    if (value.isEmpty) {
      results = _countries;
    } else {
      results = _countries
          .where((element) =>
              element['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      _countries = results;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.w == 'Africa') {
      pic = '${images[0]}';
    } else if (widget.w == 'Antarctica') {
      pic = '${images[1]}';
    } else if (widget.w == 'Asia') {
      pic = '${images[2]}';
    } else if (widget.w == 'Europe') {
      pic = '${images[3]}';
    } else if (widget.w == 'North America') {
      pic = '${images[4]}';
    } else if (widget.w == 'Oceania') {
      pic = '${images[5]}';
    } else if (widget.w == 'South America') {
      pic = '${images[6]}';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.w}'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    Filter(value);
                  });
                },
                controller: controller,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  labelText: 'Search',
                  hintText: 'Search',
                  hoverColor: Colors.cyan,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.cyan,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('$pic'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _countries == null ? 0 : _countries.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GestureDetector(
                          child: Card(
                            color: Colors.cyan,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    '${_countries[index]['name']}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: jsonData.funs.contains(index)
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      if (jsonData.funs.contains(index)) {
                                        jsonData.funs.remove(index);
                                        //  print(jsonData.funs);
                                        fav.remove(_countries[index]);
                                        print(fav);
                                        setState(() {
                                          x = true;
                                        });
                                      } else {
                                        jsonData.funs.add(index);
                                        //print(jsonData.funs);
                                        fav.add(_countries[index]);
                                        print(fav);
                                        setState(() {
                                          x = false;
                                        });
                                      }
                                    }),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details(
                                          _countries[index]['name'].toString(),
                                          _countries[index]['native']
                                              .toString(),
                                          _countries[index]['phone'].toString(),
                                          _countries[index]['continent']
                                              .toString(),
                                          _countries[index]['capital']
                                              .toString(),
                                          _countries[index]['currency']
                                              .toString(),
                                          _countries[index]['languages']
                                              .toString(),
                                          _countries[index]['emoji'].toString(),
                                          _countries[index]['emojiU']
                                              .toString(),
                                        )));
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget MyIconButton(bool y) {
    //bool x=y;
    Color d = Colors.black;
    Color s = Colors.white;
    // bool b=true;
    return GestureDetector(
      child: IconButton(
        icon: Icon(
          Icons.favorite,
          color: y == true ? d : s,
        ),
      ),
      onTap: () {
        setState(() {
          y = false;
        });
      },
    );
  }

}
