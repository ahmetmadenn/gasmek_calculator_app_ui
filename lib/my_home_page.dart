import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String buttonValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Calculator'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(bottom: 16, right: 16),
                height: MediaQuery.of(context).size.height * 0.3,
                child: Text(buttonValue,
                    style: const TextStyle(color: Colors.white, fontSize: 50))),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(child: circleContainer(value: 'AC')),
                      Expanded(child: circleContainer(value: '+/-')),
                      Expanded(child: circleContainer(value: '%')),
                      Expanded(child: circleContainer(value: '/')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: circleContainer(value: '7')),
                      Expanded(child: circleContainer(value: '8')),
                      Expanded(child: circleContainer(value: '9')),
                      Expanded(child: circleContainer(value: 'x')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: circleContainer(value: '4')),
                      Expanded(child: circleContainer(value: '5')),
                      Expanded(child: circleContainer(value: '6')),
                      Expanded(child: circleContainer(value: '7')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: circleContainer(value: '1')),
                      Expanded(child: circleContainer(value: '2')),
                      Expanded(child: circleContainer(value: '3')),
                      Expanded(child: circleContainer(value: '+')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(flex: 2, child: zeroContainer()),
                      Expanded(child: circleContainer(value: '+/-')),
                      Expanded(child: circleContainer(value: '%')),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget circleContainer({required String value, Function()? onTap}) {
    return InkWell(
      onTap: () {
        if (buttonValue.length <= 9) {
          setState(() {
            buttonValue += value;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Text(
          value,
          style: const TextStyle(fontSize: 36),
        ),
      ),
    );
  }

  Widget zeroContainer() {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: Colors.white,
      ),
      child: const Text(
        '0',
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}
