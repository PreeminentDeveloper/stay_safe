import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stay_safe/Screens/Widgets/form_test.dart';

class DiagnosticTest extends StatefulWidget {

  DiagnosticTest({Key key})
      : super(key: key);
  @override
  _DiagnosticTestState createState() => _DiagnosticTestState();
}

class _DiagnosticTestState extends State<DiagnosticTest> {
  GlobalKey<FormState> ageKey = GlobalKey();

  bool checkCough = false,
      checkHeadache = false,
      checkCatarrh = false,
      checkFever = false,
      checkBreathing = false,
      checkWeakness = false,
      checkSoreThroat = false,
      checkDiarrhoea = false,
      checkLossOfTaste = false,
      checkLossOfSmell = false;

  var headachePercent = 0,
      coughPercent = 0,
      catarrhPercent = 0,
      feverPercent = 0,
      breathingPercent = 0,
      weaknessPercent = 0,
      soreThroatPercent = 0,
      diarrhoeaPercent = 0,
      lossOfTastePercent = 0,
      lossOfSmellPercent = 0,
      result = 0,
      age;

  bool ageError = false, ageErrorChecked = false;
  
  var ageErrorReturned;

  dialogBox(String content) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Message"),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: Text('OK', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  validateAge() {
    
    // ageKey.currentState.save();
    print("Age is $age");
    if(age == null){
      setState(() {
        ageError = true;
        ageErrorReturned = "Please enter age";
      });
      dialogBox("Please enter age");
      return true;
    }
    else if (age < 1 || age > 100) {
      setState(() {
        ageError = true;
        ageErrorReturned = "Age ranges from 1 to 100";
      });
      dialogBox("Age ranges from 1 to 100");
      return true;
    }else{
      setState(() {
        ageError = false;
      });
      return false;
    }
  }

  // handleValidation(value) {
  //   if (validateAge()) return;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: Color.fromRGBO(73, 50, 155, 1.0),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Diagnostic Test",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Color.fromRGBO(237, 231, 255, 1.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Age",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromRGBO(73, 50, 155, 1.0),
                                    letterSpacing: 1),
                              ),
                            ),
                            Container(
                              width: 50,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Form(
                                key: ageKey,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      age = int.parse(value);
                                    });
                                  },
                                  validator: (value) {
                                    return validateAge();
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]')),
                                  ],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ageError == true
                            ? Padding(
                              padding: const EdgeInsets.only(left: 10, bottom: 20),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(ageErrorReturned,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.red))),
                            )
                            : Text(''),
                        FormTest(
                          symptom: 'Headache',
                          icon: Icon(
                            checkHeadache == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                          ),
                          onTap: () {
                            setState(() {
                              checkHeadache = !checkHeadache;
                              if (checkHeadache == true) {
                                headachePercent = 5;
                                result += headachePercent;
                                print("Result = $result");
                              }else{
                                result -= headachePercent;
                                print("Result = $result");
                              }
                            });
                          },
                        ),
                        FormTest(
                          symptom: 'Cough',
                          icon: Icon(
                            checkCough == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                          ),
                          onTap: () {
                            setState(() {
                              checkCough = !checkCough;
                              if (checkCough == true) {
                                coughPercent = 5;
                                result += coughPercent;
                                print("Result = $result");
                              }else{
                                result -= coughPercent;
                                print("Result = $result");
                              }
                            });
                          },
                        ),
                        FormTest(
                          symptom: 'Catarrh',
                          icon: Icon(
                            checkCatarrh == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                          ),
                          onTap: () {
                            setState(() {
                              checkCatarrh = !checkCatarrh;
                              if (checkCatarrh == true) {
                                catarrhPercent = 5;
                                result += catarrhPercent;
                                print("Result = $result");
                              }else{
                                result -= catarrhPercent;
                                print("Result = $result");
                              }
                            });
                          },
                        ),
                        FormTest(
                          symptom: 'Fever',
                          icon: Icon(
                            checkFever == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                          ),
                          onTap: () {
                            setState(() {
                              checkFever = !checkFever;
                              if (checkFever == true) {
                                feverPercent = 5;
                                result += feverPercent;
                                print("Result = $result");
                              }else{
                                result -= feverPercent;
                                print("Result = $result");
                              }
                            });
                          },
                        ),
                        FormTest(
                          symptom: 'Difficulty in breathing',
                          icon: Icon(
                            checkBreathing == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                          ),
                          onTap: () {
                            setState(() {
                              checkBreathing = !checkBreathing;
                              if (checkBreathing == true) {
                                breathingPercent = 15;
                                result += breathingPercent;
                                print("Result = $result");
                              }else{
                                result -= breathingPercent;
                                print("Result = $result");
                              }
                            });
                          },
                        ),
                        FormTest(
                          symptom: 'Weakness',
                          icon: Icon(
                            checkWeakness == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                          ),
                          onTap: () {
                            setState(() {
                              checkWeakness = !checkWeakness;
                              if (checkWeakness == true) {
                                weaknessPercent = 15;
                                result += weaknessPercent;
                                print("Result = $result");
                              }else{
                                result -= weaknessPercent;
                                print("Result = $result");
                              }
                            });
                          },
                        ),
                        FormTest(
                          symptom: 'Sore throat',
                          icon: Icon(
                            checkSoreThroat == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                          ),
                          onTap: () {
                            setState(() {
                              checkSoreThroat = !checkSoreThroat;
                              if (checkSoreThroat == true) {
                                soreThroatPercent = 15;
                                result += soreThroatPercent;
                                print("Result = $result");
                              }else{
                                result -= soreThroatPercent;
                                print("Result = $result");
                              }
                            });
                          },
                        ),
                        FormTest(
                          symptom: 'Diarrhoea',
                          icon: Icon(
                            checkDiarrhoea == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                          ),
                          onTap: () {
                            setState(() {
                              checkDiarrhoea = !checkDiarrhoea;
                              if (checkDiarrhoea == true) {
                                diarrhoeaPercent = 5;
                                result += diarrhoeaPercent;
                                print("Result = $result");
                              }else{
                                result -= diarrhoeaPercent;
                                print("Result = $result");
                              }
                            });
                          },
                        ),
                        FormTest(
                          symptom: 'Loss of taste',
                          icon: Icon(
                            checkLossOfTaste == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                          ),
                          onTap: () {
                            setState(() {
                              checkLossOfTaste = !checkLossOfTaste;
                              if (checkLossOfTaste == true) {
                                lossOfTastePercent = 15;
                                result += lossOfTastePercent;
                                print("Result = $result");
                              }else{
                                result -= lossOfTastePercent;
                                print("Result = $result");
                              }
                            });
                          },
                        ),
                        FormTest(
                          symptom: 'Loss of smell',
                          icon: Icon(
                            checkLossOfSmell == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                          ),
                          onTap: () {
                            setState(() {
                              checkLossOfSmell = !checkLossOfSmell;
                              if (checkLossOfSmell == true) {
                                lossOfSmellPercent = 15;
                                result += lossOfSmellPercent;
                                print("Result = $result");
                              }else{
                                result -= lossOfSmellPercent;
                                print("Result = $result");
                              }
                            });
                          },
                        ),
                        SizedBox(height: 30.0),
                        SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              color: Color.fromRGBO(73, 50, 155, 1.0),
                              splashColor: Color.fromRGBO(197, 191, 255, 1.0),
                              onPressed: () {
                                validateAge();
                                if(result > 0){
                                  if(ageError == false){
                                    if(age >= 50 && age <= 100){
                                    dialogBox(
                                    "Your chances of being infected is $result% with higher risk");
                                  }else{
                                    dialogBox(
                                    "Your chances of being infected is $result%");
                                  }
                                  }
                                }else{
                                  dialogBox(
                                    "Please select symptoms");
                                }
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
