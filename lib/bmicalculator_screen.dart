import 'package:bmi/bmi_model.dart';
import 'package:bmi/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;
  double _bmi = 0.0;

  late BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: const Icon(
                  CupertinoIcons.heart,
                  size: 200.0,
                  color: Colors.pink,
                ),
              ),
              Text(
                'BMI Calculator',
                style: TextStyle(
                    color: Colors.pink[600],
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'About Your Health',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                'Height (cm)',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Slider(
                  min: 80.0,
                  max: 200.0,
                  onChanged: (height) {
                    setState(() {
                      _heightOfUser = height;
                    });
                  },
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: '$_heightOfUser',
                ),
              ),
              Text(
                '$_heightOfUser cm',
                style: TextStyle(
                    color: Colors.pink[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'Weight (kg)',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Slider(
                  min: 30.0,
                  max: 150.0,
                  onChanged: (height) {
                    setState(() {
                      _weightOfUser = height;
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: '$_weightOfUser',
                ),
              ),
              Text(
                '$_weightOfUser kg',
                style: TextStyle(
                    color: Colors.pink[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                //color: Colors.pink[100],
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _bmi = _weightOfUser / ((_heightOfUser / 100) * (_heightOfUser / 100)) ;
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: true,
                            comments: 'You are  Normal');
                      } else if (_bmi < 18.5) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: 'You are  Underweight') ;
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: 'You are  Overweight') ;
                      } else {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: 'You are  Obese');
                      }
                    });
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ResultScreen(bmiModel: _bmiModel,)
                    ));
                  },
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(color: Colors.pink, fontSize: 30.0),
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
