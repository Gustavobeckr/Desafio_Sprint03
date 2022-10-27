import 'package:app_contacts/src/database/dao/contact_dao.dart';
import 'package:app_contacts/src/models/contact_model.dart';
import 'package:app_contacts/src/screens/add_contact.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = 'Contacts';

  bool clickSearch = true;

  _changeClickSearch() {
    setState(() {
      clickSearch = !clickSearch;
    });
  }

  final ContactDao _dao = ContactDao();

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
        child: FutureBuilder<List<ContactModel>>(
          initialData: [],
          future: _dao.findAll(),
          builder: (context, snapshot) {
            final List<ContactModel>? contacts = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text(
                        'Loading',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                return ListView.builder(
                    itemCount: contacts?.length,
                    itemBuilder: (context, index) {
                      final ContactModel contact = contacts![index];
                      return CardContact();
                    });
            }
            return Center(child: Text('ERROR'));
          },
        ),
      ),
    );
  }
}

class CardContact extends StatelessWidget {
  late final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5),
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
                        decoration:
                            BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.1)),
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
                        contact.name.toString(),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        contact.phoneNumber.toString(),
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
  }
}
