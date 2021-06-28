import 'package:raramart/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:raramart/utils/helper.dart';

class CustomStepper extends StatefulWidget {
  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  int value;
  final ValueChanged<dynamic> onChanged;

  CustomStepper({
    required this.lowerLimit,
    required this.upperLimit,
    required this.stepValue,
    required this.value,
    required this.onChanged,
  });

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: kDarkGrey.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(
                Icons.remove,
                size: 22,
                color: kWhite,
              ),
              onPressed: () {
                setState(() {
                  widget.value = (widget.value == widget.lowerLimit)
                      ? widget.lowerLimit
                      : widget.value -= widget.stepValue;

                  this.widget.onChanged(widget.value);
                });
              }),
          Container(
            height: 50,
            width: 50,
            color: kWhite,
            child: Center(
              child: kText(
                text: "${widget.value}",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 22,
              color: kWhite,
            ),
            onPressed: () {
              setState(() {
                widget.value = (widget.value == widget.upperLimit)
                    ? widget.upperLimit
                    : widget.value += widget.stepValue;

                this.widget.onChanged(widget.value);
              });
            },
          ),
        ],
      ),
    );
  }
}
