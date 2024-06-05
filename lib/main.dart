

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculater_app/providers/TIpCalculatorModel.dart';
import 'package:tip_calculater_app/providers/ThemeProvider.dart';

import 'package:tip_calculater_app/widget/BillAmount.dart';
import 'package:tip_calculater_app/widget/Tip_Slider.dart';
import 'package:tip_calculater_app/widget/PersonCounter.dart';
import 'package:tip_calculater_app/widget/toggleButton.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ( context) => TipCalculatorModel()),
      ChangeNotifierProvider(create: (context) => ThemeProvider())
  ],
    child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final toggle = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'CheckMate',
      theme: toggle.currentTheme,

      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const CheckMate(),
    );
  }
}

class CheckMate extends StatefulWidget {
  const CheckMate({super.key});

  @override
  State<CheckMate> createState() => _CheckMateState();
}

class _CheckMateState extends State<CheckMate> {
  @override



  // double _totalPerPerson(){
  //   return ((_billtotal * _tippercentage) + (_billtotal)) / _personCount;
  // }
  //
  // double totalTip(){
  //   return (_billtotal * _tippercentage);
  // }


  Widget build(BuildContext context) {
    // style theme
    var theme = Theme.of(context);
    final model = Provider.of<TipCalculatorModel>(context);


    double total = model.billTotal;
    double totaltip = model.tipPercentage;

    var style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );


    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckMate'),
        actions: [
          toggleThemeButton()
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                padding: EdgeInsets.all(26),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total per person',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          model.totalPerPerson.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          //   FORM
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(20),
              // width: 100,
              // height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:Colors.teal ,
                    width: 2,
                  )),
              child: Column(
                children: [
                  BillAmount(
                    billAmount: model.billTotal.toString(),
                    onChanged: (value){
                       model.updateBill(double.parse(value));
                    },
                  ),
                  // Split section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Split',
                        style: theme.textTheme.titleMedium,
                      ),
                      PersonCounter(
                        theme: theme,
                        personCount: model.personCount,
                        onDecrement: () => {
                          if(model.personCount> 1){
                            model.updatePersonCount(model.personCount-1)
                          }
                        },
                        onIncrement: () =>{
                          model.updatePersonCount(model.personCount + 1)
                        },
                      )

                    ],
                  ),
                  //   tip section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text('Tip',
                      style: theme.textTheme.titleMedium,),
                      Text("\$${(totaltip*100).toStringAsFixed(2)}",
                      style: theme.textTheme.titleMedium,)
                    ],
                  ),
                //   slider show percentage
                  Text('${(model.tipPercentage*100).round()}%'),
                  
                //   tip slider
                  TipSlider(tippercentage: model.tipPercentage,
                    onChanged: (double value) {
                       model.updateTip(value);
                  }, percentage: model.tipPercentage,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}





