import 'package:flutter/material.dart';
import 'package:quizdemo/answer_button.dart';
import 'package:quizdemo/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({required this.onSelectAnswer,super.key});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
   
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context){
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 24,
              color: const Color.fromARGB(141, 255, 255, 255)
            ),
            
            ),
            SizedBox(height: 20,),
            ...currentQuestion.getShuffledAnswers().map((answer) =>
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: AnswerButton(
                  answerText: answer, 
                  onTap: (){
                    answerQuestion(answer);
                    }
                ),
              ))
            
          ],
        ),
      ),
    );
  }
}