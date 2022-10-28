import 'package:app_contacts/src/controllers/HomeController.dart';
import 'package:flutter/material.dart';

class CardText extends StatefulWidget {
  @override
  State<CardText> createState() => _CardTextState();
}

class _CardTextState extends State<CardText> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ListView.builder(
          itemCount: controller.listCards.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xFF000000),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.listCards[index].author
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  controller.listCards[index].text.toString(),
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
