import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtControlar = TextEditingController();
  var ftControlar = TextEditingController();
  var inControlar = TextEditingController();
  var result = "";
  var bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          ' Your BMI',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BMI',
                style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: wtControlar,
                decoration: const InputDecoration(
                    hintText: 'Enter your Weight (in Kgs)', prefixIcon: Icon(Icons.line_weight_outlined)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: ftControlar,
                decoration:
                    const InputDecoration(hintText: 'Enter your height (in feet)', prefixIcon: Icon(Icons.height)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: inControlar,
                decoration: const InputDecoration(
                    hintText: 'Enter your height (in inch)', prefixIcon: Icon(Icons.line_weight_outlined)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  var wt = wtControlar.text.toString();
                  var ft = ftControlar.text.toString();
                  var inch = inControlar.text.toString();
                  if (wt != '' && ft != '' && inch != '') {
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt * 12) + iInch;

                    var tCm = tInch * 2.54;

                    var tM = tCm / 100;

                    var bmi = iWt / (tM * tM);

                    var msg = '';

                    if (bmi > 25) {
                      msg = ' You Are Over Weight!! ';
                      bgColor = Colors.orange;
                    } else if (bmi < 18) {
                      msg = ' You Are Under Weight!! ';
                      bgColor = Colors.red;
                    } else {
                      msg = ' You Are Healthy!! ';
                      bgColor = Colors.green;
                    }

                    setState(() {
                      result = ' $msg Your BMI is : ${bmi.toStringAsFixed(4)}';
                    });
                  } else {
                    setState(() {
                      result = 'please fill all the requird blanks !!';
                    });
                  }
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                result,
                style: const TextStyle(fontSize: 19),
              )
            ],
          ),
        ),
      ),
    );
  }
}
