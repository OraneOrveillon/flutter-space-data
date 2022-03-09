import 'package:flutter/material.dart';

class SelectionMenu extends StatelessWidget {
  const SelectionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Stack(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Planets',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Doctor Glitch',
                        fontSize: 80,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                ],
              ),
              // GridView.builder(
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 3,
              //     ),
              //     itemCount: 300,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Card(
              //         color: Colors.amber,
              //         child: Center(child: Text('$index')),
              //       );
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
