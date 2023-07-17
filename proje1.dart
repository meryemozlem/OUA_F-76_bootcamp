import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController boyController = TextEditingController();
  TextEditingController kiloController = TextEditingController();
  String bmi = '';

  @override
  Widget build(BuildContext context) {
    double h;
    double w;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: boyController,
              decoration: InputDecoration(hintText: 'Boyunuz(cm)'),
            ),
            TextField(
              controller: kiloController,
              decoration: InputDecoration(hintText: 'Kilonuz(kg)'),
            ),
            ElevatedButton(
                onPressed: () {
                  h = double.parse(boyController.value.text);
                  w = double.parse(kiloController.value.text);

                  //String r = result.toStringAsFixed(2);
                  setState(() {
                    double result = w / (h * h / 10000);
                    bmi = result.toStringAsFixed(2);
                    print(bmi);
                  });
                },
                child: Text('Calculate')),
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                child: Text(
                  'BMI: $bmi',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 52),
                ))
          ],
        ),
      ),
    );
  }
}

String calculateBMI(double height, double weight) {
  double result = weight / (height * height / 1000);
  String r = result.toStringAsFixed(2);
  return r;
}
