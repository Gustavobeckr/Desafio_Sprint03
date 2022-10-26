import 'package:app_contacts/src/components/AddContact.dart';
import 'package:app_contacts/src/controllers/HomeController.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  String title = 'Contacts';

  bool clickSearch = true;

  _changeClickSearch() {
    setState(() {
      clickSearch = !clickSearch;
    });
  }

  _success() {
    return ListView.builder(
        itemCount: controller.contacts.length,
        itemBuilder: (context, index) {
          var contact = controller.contacts[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(children: [
                          ClipOval(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.1)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 2, 0, 0),
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                        ]),
                        SizedBox(width: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              '${contact.name}',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '${contact.phoneNumber}',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.local_phone,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: Text("Tentar novamente"),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loadind:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
    }
  }

  @override
  void initState() {
    super.initState();

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 8,
          title: clickSearch
              ? Text(title)
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
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
                      hintText: 'Search contact',
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
                icon: clickSearch
                    ? Icon(Icons.search)
                    : Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddContact();
              });
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return stateManagement(controller.state.value);
          },
        ),
      ),
    );
  }
}
