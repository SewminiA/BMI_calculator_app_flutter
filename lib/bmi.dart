import 'dart:math';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool male = true;
  int height = 100;
  int weight = 50;
  int age = 50;
  late String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2a1943),
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                male = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: male ? Colors.blue : Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.male,
                                    size: 100,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                male = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: male ? Colors.grey : Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.female,
                                    size: 100,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                )),
            // Height Slider
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Height",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "cm",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          min: 70,
                          max: 230,
                          value: height.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          })
                    ],
                  ),
                )),
            // Weight and Age Sliders
            Row(
              children: [
                // Weight Slider
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            weight.toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          Slider(
                            min: 30,
                            max: 200,
                            value: weight.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                weight = value.round();
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Age Slider
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            age.toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          Slider(
                            min: 10,
                            max: 120,
                            value: age.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                age = value.round();
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Calculate Button
            MaterialButton(
              height: 60,
              color: Colors.greenAccent,
              minWidth: double.infinity,
              onPressed: () {
                double bmi = weight / pow(height / 100, 2);
                if (bmi.round() < 18) {
                  result = "Underweight";
                } else if (bmi.round() >= 18 && bmi.round() < 25) {
                  result = "Normal";
                } else {
                  result = "Overweight";
                }
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Result(
                  male: male,
                  height: height,
                  weight: weight,
                  age: age,
                  result: result,
                )));
              },
              child: const Text("Calculate"),
            )
          ],
        ),
      ),
    );
  }
}
