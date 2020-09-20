import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:intl/intl.dart';

class LabTestPage extends StatefulWidget {

  @override
  _LabTestPageState createState() => _LabTestPageState();
}

class _LabTestPageState extends State<LabTestPage> {
  TextEditingController _problemController = TextEditingController();

  var cashpayment = false;
  var selectDate = 'Satuday';
  var selectTestCategory = 'Comprehensive Metabolic Panel';
  var selectTest = 'Lipid panel';

  var time= '00:00 AM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColor.themered,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.keyboard_backspace)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerpart(context),
            payment(context),
            bookAppointmentButton(context),
          ],
        ),
      ),
    );
  }

  Widget headerpart(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: LightColor.themered,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, bottom: 10),
            child: Text(
              'Lab test',
              style: TextStyle(
                color: LightColor.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 30),
            child: Text(
              'Find your test from the below',
              style: TextStyle(
                color: LightColor.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              'Test category',
              style: TextStyle(
                color: LightColor.white,
                fontSize: 16,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: LightColor.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: LightColor.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset:
                      Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: DropdownButton(
                    hint: Text(
                      selectTestCategory,
                      style: TextStyle(color: LightColor.black,
                          fontSize: 16),
                    ),
                    isExpanded: true,
                    iconSize: 30.0,
                    underline: Text(''),
                    style: TextStyle(color: LightColor.black,fontSize: 18),
                    items: ['Comprehensive Metabolic Panel', 'Lipid Panel', 'Liver Panel','Urinalysis','Cultures'].map(
                          (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                            () {
                          selectTestCategory = val;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              'Choose Test',
              style: TextStyle(
                color: LightColor.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: LightColor.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: LightColor.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset:
                      Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: DropdownButton(
                    hint: Text(
                      selectTest,
                      style: TextStyle(color: LightColor.black,
                          fontSize: 16),
                    ),
                    isExpanded: true,
                    iconSize: 30.0,
                    underline: Text(''),
                    style: TextStyle(color: LightColor.black,fontSize: 18),
                    items: ['Comprehensive Metabolic Panel', 'Lipid Panel', 'Liver Panel','Urinalysis','Cultures'].map(
                          (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                            () {
                          selectTest = val;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              'Choose your prefered time',
              style: TextStyle(
                color: LightColor.white,
                fontSize: 16,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: LightColor.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: LightColor.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: DropdownButton(
                            hint: Text(
                              selectDate,
                              style: TextStyle(color: LightColor.black,
                              fontSize: 16),
                            ),
                            isExpanded: true,
                            iconSize: 30.0,
                            underline: Text(''),
                            style: TextStyle(color: LightColor.black,fontSize: 18),
                            items: ['Saturday', 'Sunday', 'Monday','Tuesday','Wednesday','Thursday','Friday'].map(
                                  (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                    () {
                                  selectDate = val;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        openTimePicker(context);
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: LightColor.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: LightColor.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 15,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ]),
                        child: Center(
                          child: Text(
                            '$time',
                            style:
                                TextStyle(color: LightColor.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget payment(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Payment',
              style: TextStyle(
                color: LightColor.lightblack,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 4 - 25,
                right: MediaQuery.of(context).size.width / 4 - 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/paypal.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/visa.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/mastercard.png',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Divider(
              thickness: 1,
              color: LightColor.lightblack.withOpacity(0.5),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: cashpayment,
                  activeColor: LightColor.themered,
                  onChanged: (bool newValue) {
                    setState(() {
                      cashpayment = newValue;
                    });
                  }),
              Text(
                'Pay with money',
                style: TextStyle(
                  color: LightColor.lightblack,
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  bookAppointmentButton(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(20,10.0,10,20),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: RaisedButton(onPressed: (){},
            color: LightColor.themered,
            child: Text('Add to cart',
            style: TextStyle(
              color: LightColor.white,
              fontSize: 18
            ),),
          ),
        ),
      ),
    );

  }

  void openTimePicker(BuildContext context) {
    DatePicker.showTime12hPicker(context,
        showTitleActions: true,

        onChanged: (date) {
          setState(() {
            time = DateFormat('hh:mm aa').format(date);
          });
        }, onConfirm: (date) {
          setState(() {
            time = DateFormat('hh:mm aa').format(date);
          });
        }, currentTime: DateTime.now(), locale: LocaleType.en);


  }
}