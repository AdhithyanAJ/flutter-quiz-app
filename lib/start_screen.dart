import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: const Color.fromARGB(125, 255, 255, 255),
            width: 300,),
          SizedBox(height: 40,),
          Text('Welcome to flutter quiz!',
          style: GoogleFonts.lato(
            fontSize: 28,
            color: const Color.fromARGB(181, 255, 255, 255),
          ),),
          SizedBox(height: 20,),
          ElevatedButton.icon(
            onPressed: startQuiz, 
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.purple
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text('Start Quiz'))
        ],
      ),
    );
  }
}