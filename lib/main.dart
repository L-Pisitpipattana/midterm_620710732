import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _lengthCont = TextEditingController();
  final _girthCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        //SizedBox(width: 8.0),
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Text(
              "PIG WEIGHT",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.pinkAccent),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CALCULATOR",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.pinkAccent),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                      child: Image.asset(
                    "assets/images/pig.png",
                    height: 180.0,
                  )),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('LENGTH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                            const Text('(cm)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 10.0),
                              child: TextField(
                                  controller: _lengthCont,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter length',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 17.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('GIRTH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                            const Text('(cm)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 10.0),
                              child: TextField(
                                  controller: _girthCont,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter girth',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 17.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink, // background
                  onPrimary: Colors.white, // foreground
                  minimumSize: const Size(60.0, 60.0),
                ),
                child: const Text('CALCULATE',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                onPressed: () {
                  var lengthText = _lengthCont.text;
                  var girthText = _girthCont.text;
                  double? length = double.tryParse(lengthText);
                  double? girth = double.tryParse(girthText);
                  if (length == null || girth == null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('ERROR'),
                          content: Text('Invalid Input'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    double weight =
                        (girth / 100) * (girth / 100) * (length / 100) * 69.3;
                    double price = 112.50 * weight;
                    double minWeight = 0.97 * weight;
                    double maxWeight = 1.03 * weight;
                    double minPrice = 0.97 * price;
                    double maxPrice = 1.03 * price;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Image.asset(
                                'assets/images/ic_pig.png',
                                height: 30.0,
                              ),
                              Text('RESULT'),
                            ],
                          ),
                          content: Text(
                              'Weight: ${minWeight.round()} - ${maxWeight.round()} kg\nPrice: ${minPrice.round()} - ${maxPrice.round()} Baht'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
