import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightValue = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Center(child: Text("Body Mass Index")),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded(context, "male"),
                    const SizedBox(width: 15),
                    m1Expanded(context, "female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height",
                          style: Theme.of(context).textTheme.displayMedium),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(heightValue.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.displayLarge),
                          Text("cm",
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                      Slider(
                          min: 90,
                          max: 220,
                          value: heightValue,
                          onChanged: (newValue) =>
                              setState(() => heightValue = newValue))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded(context, "weight"),
                    const SizedBox(width: 15),
                    m2Expanded(context, "age"),
                  ],
                ),
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              //باخذ نسبة الارتفاع من اي جهاز بحيث يكون ريسبونسف للزر
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  //المعادلة لحساب
                  var result = weight / pow(heightValue / 100, 2);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Result(result: result, isMale: isMale, age: age);
                    }),
                  );
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//functions for male and female Card
  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMale = (type == 'male') ? true : false),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //عملت شرط للذكر والانثى
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? "Male" : "Female",
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    //للزيادة
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  mini: true,
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    //للنقصان
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  mini: true,
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
