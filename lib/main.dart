import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' BMI CALCULATOR APP'),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
      ),
      body: Container(
        color:Colors.purple.shade100,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bmi',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 21,),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                      labelText: 'Enter your weight in kgs',
                      prefixIcon: Icon(Icons.line_weight)
                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                      labelText: 'Enter your height in feet',
                      prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                      labelText: 'Enter your height in inches',
                      prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(onPressed: () {
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue);
                      var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();
                  if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                    // Calculate BMI here
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);
                    var tInch = (iFt * 12) + iInch;
                    var tCm = tInch * 2.54;
                    var tM = tCm / 100;
                    var bmi = iWt / (tM * tM);
                    var msg="";
                    if(bmi>25)
                      {
                        msg="You are overweight";
                      }
                    else if(bmi<18)
                      {
                        msg="You are underweight";
                      }
                    else{
                      msg ="You are Healthy";
                    }
                    setState(() {
                      result = "Your bmi is: ${bmi.toStringAsFixed(2)}\n$msg";
                    });
                  } else {
                    setState(() {
                      result = "Please fill all the required lines";
                    });
                  }
                }, child: Text('calculate', style: TextStyle(color: Color.alphaBlend(Colors.black, Colors.deepPurple)),)),
                SizedBox(height: 11,),
                Text(result, style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
