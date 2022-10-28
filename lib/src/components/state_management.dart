import 'package:flutter/material.dart';

import '../controllers/HomeController.dart';

final controller = HomeController();

_success() {
  return ListView.builder(
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
              padding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5),
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