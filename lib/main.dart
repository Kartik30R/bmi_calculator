import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController wtController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inController = TextEditingController();

  var result = '';
  var cr;
  var message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC1C1C1),
        title: Text(
          'myBMI',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: cr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: wtController,
              decoration: InputDecoration(
                labelText: 'Enter your weight(kg)',
                prefixIcon: Icon(Icons.line_weight),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: ftController,
              decoration: InputDecoration(
                labelText: 'Enter your height in feet',
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: inController,
              decoration: InputDecoration(
                labelText: 'Enter your height in inches',
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                var wt = wtController.text;
                var ft = ftController.text;
                var inc = inController.text;

                if (wt.isNotEmpty && ft.isNotEmpty && inc.isNotEmpty) {
                  var iwt = int.parse(wt);
                  var ift = int.parse(ft);
                  var iinc = int.parse(inc);

                  var tinch = ift * 12;
                  var tcm = (tinch + iinc) * 2.54;
                  var tm = tcm / 100;

                  var bmi = iwt / (tm * tm);
                  if (bmi < 18.5) {
                    cr = Color(0xFFA1D4ED);
                    message = 'You are underweight';
                    result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                  } else if (bmi >= 18.5 && bmi <= 24.9) {
                    cr = Color(0xFF5EFF7E);
                    message = 'You are normal';
                    result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                  } else if (bmi >= 25 && bmi <= 29.9) {
                    cr = Color(0xFFFFFF5E);
                    message = 'You are overweight';
                    result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                  } else if (bmi >= 30 && bmi <= 34.9) {
                    cr = Color(0xFFFFC45E);
                    message = 'You are obese';
                    result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                  } else {
                    cr = Color(0xFFFF5E5E);
                    message = 'You are severely obese';
                    result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                  }

                  setState(() {});
                } else {
                  setState(() {
                    result = 'Fill all the values!';
                  });
                }
              },
              child: Text('Calculate'),
            ),
            Text(result),
            Text(message),
          ],
        ),
      ),
    );
  }
}
