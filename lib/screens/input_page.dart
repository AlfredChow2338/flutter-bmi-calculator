import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../calculator_brain.dart';
import 'results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int height = 180;
  int weight = 60;
  int age = 18;
  Color maleColor = kInactiveCardColor;
  Color femaleColor = kInactiveCardColor;

  setColor(Gender gender) {
    if (gender == Gender.male) {
      setState(() {
        selectedGender = Gender.male;
      });
    } else {
      selectedGender = Gender.female;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childWidget: IconContent(
                        icon: FontAwesomeIcons.mars, textContent: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childWidget: IconContent(
                        icon: FontAwesomeIcons.venus, textContent: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kHeightTextStyle,
                          ),
                          Text('cm', style: kLabelTextStyle),
                        ]),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kHeightTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // FloatingActionButton(
                            //   onPressed: () {},
                            //   backgroundColor: kButtonColor,
                            //   child: Icon(Icons.add, color: Colors.white),
                            // ),
                            RoundCircleButton(
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              iconData: Icon(FontAwesomeIcons.minus,
                                  color: Colors.white),
                            ),
                            SizedBox(width: 20.0),
                            RoundCircleButton(
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              iconData: Icon(FontAwesomeIcons.plus,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      color: kActiveCardColor,
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: kLabelTextStyle),
                          Text(age.toString(), style: kHeightTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundCircleButton(
                                  iconData: Icon(FontAwesomeIcons.minus,
                                      color: Colors.white),
                                  onPress: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(width: 20.0),
                              RoundCircleButton(
                                  iconData: Icon(FontAwesomeIcons.plus,
                                      color: Colors.white),
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE YOUR BMI',
            onPress: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    result: calc.getResult(),
                    bmi: calc.getBMI(),
                    description: calc.getDescription(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundCircleButton extends StatelessWidget {
  RoundCircleButton({@required this.iconData, @required this.onPress});
  final Icon? iconData;
  final Function? onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: iconData,
        onPressed: () {
          onPress!();
        },
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        fillColor: kButtonColor,
        shape: CircleBorder(),
        elevation: 6.0);
  }
}
