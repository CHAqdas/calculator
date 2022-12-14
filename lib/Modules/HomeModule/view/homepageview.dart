import 'package:calculator_app/Modules/HomeModule/model/buttonmodel.dart';
import 'package:calculator_app/utils/buttons.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  model mdata = model();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width / 20),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            mdata.question,
                            style: const TextStyle(fontSize: 26),
                          )),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            mdata.answer,
                            style: const TextStyle(fontSize: 26),
                          )),
                    ],
                  )),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: GridView.builder(
                  itemCount: mdata.buttontext.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Mybutton(
                          buttontapped: () {
                            setState(() {
                              mdata.question = '';
                              mdata.answer = '0';
                            });
                          },
                          text: mdata.buttontext[index],
                          textcolor: Colors.white,
                          color: Colors.black);
                    } else if (index == 1) {
                      return Mybutton(
                          buttontapped: () {
                            setState(() {
                              try {
                                mdata.question = mdata.question
                                    .substring(0, mdata.question.length - 1);
                                mdata.answer = '0';
                              } catch (e) {
                                print(e);
                              }
                            });
                          },
                          text: mdata.buttontext[index],
                          textcolor: Colors.white,
                          color: Colors.black);
                    } else if (index == mdata.buttontext.length - 1) {
                      return Mybutton(
                          buttontapped: () {
                            setState(() {
                              mdata.equaltapped();
                            });
                          },
                          text: mdata.buttontext[index],
                          textcolor: Colors.white,
                          color: Colors.black);
                    } else {
                      return Mybutton(
                          buttontapped: () {
                            setState(() {
                              mdata.question += mdata.buttontext[index];
                            });
                          },
                          text: mdata.buttontext[index],
                          textcolor: (mdata.isoperator(mdata.buttontext[index]))
                              ? Colors.white
                              : Colors.black,
                          color: (mdata.isoperator(mdata.buttontext[index]))
                              ? Colors.black
                              : Colors.grey.shade300);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
