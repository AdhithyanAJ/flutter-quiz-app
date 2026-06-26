import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton(
    {required this.answerText,
    required this.onTap,
    super.key});

    final String answerText;
    final void Function() onTap;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 157, 49, 176),
          foregroundColor: const Color.fromARGB(226, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          )
        ),
        child: Text(answerText,textAlign: TextAlign.center,)),
    );
  }
    }