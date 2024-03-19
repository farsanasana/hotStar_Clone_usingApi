import 'package:flutter/material.dart';
import 'package:newwhost/Api_function/Function.dart';

class Myspace extends StatelessWidget {
  const Myspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(1, 27, 87, 1),
              Color.fromRGBO(1, 12, 36, 1),
            ])),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/hot.png',
                height: 100,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  Text(
                    'Help & Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              const Column(
                children: [
                  Text(
                    'Subscribee to enjoy Disney +  ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 180),
                    child: Text(
                      'Hotstar',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 13, 52, 252)),
                    child: const Text(
                      'Subscribe',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const Text(
                    'Plan starts at ₹149',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Profiles',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                width: 60,
              ),
              Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Profile(
                imageurl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQft76tKg6I5MYlC2liryTZFGrpVQIzSJUTqQ&usqp=CAU',
                name: 'Eva',
              ),
              SizedBox(
                width: 20,
              ),
              Profile(
                imageurl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWV6dKHmFirKFvNP5EfljnfcugjFmaY4ziMR8xBmDB6vuHeCCSMDOmC0_S5N1YkTfw9AM&usqp=CAU',
                name: 'Add',
              )
            ],
          )
        ]),
      ),
    );
  }
}
