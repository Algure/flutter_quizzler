import 'Question.dart';

class QuizBrain{

  int _questionNumber=0;

  List<Question> _qList=[
    Question(q: 'A slug\'s blood is green', a: false),
    Question(q: 'You can lead a cow down a stairs but you can\'t lead it up', a: true),
    Question(q: 'Approximately one quarter of human bones are in the feet', a: true),];

  void nextQuestion(){
    if(_questionNumber<_qList.length-1)
      _questionNumber++;
  }
  String getQuestionText (int qnum){
    return _qList[qnum].questionText;
  }

  bool getQuestionAnswer(int qnum){
    return _qList[qnum].questionAnswer;
  }

  int getQsize(){
    return _qList.length;
  }
}