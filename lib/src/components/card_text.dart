import 'package:app_contacts/src/controllers/HomeController.dart';
import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.listCards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          SizedBox(width: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                controller.listCards[index].author.toString(),
                                style: TextStyle(

                                    fontSize: 25, fontWeight: FontWeight.bold),
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
        });
  }
}
