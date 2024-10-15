import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int weight = 70;
  int age = 23;
  double height = 0.0;
  String gender = 'Male';
  double bmi = 0.0;
  String bmiCategory = 'Underweight';

  void calculateBmi() {
    if (height > 0) {
      setState(() {
        bmi = weight / ((height / 100) * (height / 100));
        if (bmi < 18.5) {
          bmiCategory = 'Underweight';
        } else if (bmi >= 18.5 && bmi < 24.9) {
          bmiCategory = 'Normal weight';
        } else if (bmi >= 25 && bmi < 29.9) {
          bmiCategory = 'Overweight';
        } else {
          bmiCategory = 'Obesity';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding:
                const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome😊",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'NotoColorEmoji'),
                ),
                const SizedBox(height: 5),
                const Text(
                  "BMI Calculator",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print("Male Button");
                        },
                        icon: const Icon(Icons.male),
                        label: const Text("Male"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white, 
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), 
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          // minimumSize: const Size(150, 50),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print("Womann Button");
                        },
                        icon: const Icon(Icons.female),
                        label: const Text(
                          "Woman",
                          overflow: TextOverflow.ellipsis,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: buildCard(
                        label: 'Weight',
                        value: weight,
                        onIncrement: () {
                          setState(() {
                            weight++;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            if (weight > 0) weight--;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: buildCard(
                        label: 'Age',
                        value: age,
                        onIncrement: () {
                          setState(() {
                            age++;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            if (age > 0) age--;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "Height",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, 
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.5, 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        15.0), 
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      height = double.tryParse(value) ?? 0.0;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Height',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      filled:
                          false,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bmi.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 48, 
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          bmiCategory,
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          calculateBmi();
                        },
                        label: const Text("Lets Go"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )));
  }
}

Widget buildCard({
  required String label,
  required int value,
  required VoidCallback onIncrement,
  required VoidCallback onDecrement,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Decrement Button
            // IconButton(
            //   icon: const Icon(Icons.remove),
            //   onPressed: onDecrement,
            //   iconSize: 30, // Adjusted size
            //   color: const Color(0xFF4A69FF),
            // ),

            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 50, 
              height: 50,
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: onIncrement,
                iconSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 50,
              height: 50,
              child: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onDecrement,
                iconSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
