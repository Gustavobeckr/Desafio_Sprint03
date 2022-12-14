import 'package:app_contacts/src/app_widget.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AddContact extends StatefulWidget {
  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _numberController = TextEditingController();

    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 15),
          elevation: 20,
          title: Text(
            'Add Contact',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            height: 184,
            width: 300,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                      filled: true,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 30,
                      ),
                      labelText: 'Contact name',
                    ),
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your name';
                      }
                      if (value.length < 3) {
                        return 'Invalid name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(0, 0, 0, 0.1),
                      filled: true,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.local_phone,
                        size: 30,
                      ),
                      labelText: 'Phone number ',
                    ),
                    controller: _numberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your phone number';
                      }
                      if (value.length < 14) {
                        return 'Invalid mobile number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(AppWidget.HOME_SCREEN);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
            TextButton(
                onPressed: () {
                        if (formKey.currentState!.validate())
                          {Navigator.pop(context);}
                },
                child: Text(
                  "Confirm",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
