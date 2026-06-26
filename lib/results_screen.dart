import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizdemo/data/questions.dart';
import 'package:quizdemo/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({required this.chooseAnswer,required this.onRestart,super.key});

  final List<String> chooseAnswer;
  final void Function() onRestart;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];
    for(var i =0;i<chooseAnswer.length;i++){
      summary.add(
        {
          "question_index" : i,
          "question" : questions[i].text,
          "correct_answer" : questions[i].answers[0],
          "user_answer" : chooseAnswer[i]
        }
      );
    }
    return summary;
  }
  
  @override
  Widget build(BuildContext context){
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data)
    {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          children: [
            Text('You answered $numCorrectQuestions out $numTotalQuestions questions',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            Expanded(child: QuestionsSummary(summaryData)),
            const SizedBox(height: 20,),
            TextButton.icon(
              onPressed: onRestart, 
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
              ),
              icon: Icon(Icons.refresh),
              label: Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}