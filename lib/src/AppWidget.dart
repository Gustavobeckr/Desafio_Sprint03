import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  String title = 'Contacts';

  bool clickSearch = true;

  _changeClickSearch() {
    setState(() {
      clickSearch = !clickSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: Colors.black,
            elevation: 20,
            title: clickSearch
                ? Text(title)
                : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        fillColor: Colors.white10,
                        filled: true,
                        prefixIcon: IconButton(
                          color: Colors.white,
                          onPressed: _changeClickSearch,
                          icon: Icon(Icons.close),
                        ),
                        hintText: 'Buscar contato',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                child: IconButton(
                  onPressed: _changeClickSearch,
                  icon:clickSearch? Icon(Icons.search) : Icon(Icons.search, color: Colors.black,),
                ),
              )
            ],
          ),
        ),
        body: const Text(''),
      ),
    );
  }
}
