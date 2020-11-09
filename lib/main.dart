import 'package:flutter/material.dart';
import 'Question.dart';
import 'QuizBrain.dart';

QuizBrain quizBrain=QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[900],
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon trueIcon= Icon(Icons.check,
      color: Colors.green);
  Icon falseIcon= Icon(Icons.close,
    color: Colors.red,);

  int questionNum=0;

  List<Widget> scoreKeeper=[];

  void increaseQno(){
    questionNum++;
  }
  void checkAnswer(bool ans){
    setState(() {
      if(questionNum<quizBrain.getQsize()) {
        if(quizBrain.getQuestionAnswer(questionNum)==ans)
          scoreKeeper.add(trueIcon);
        else
          scoreKeeper.add(falseIcon);
        increaseQno();
      }
    });
  }

  void reset() {
    setState(() {
      questionNum=0;
      scoreKeeper.clear();
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child:IconButton(
                  icon:Icon(Icons.refresh,
                color: Colors.white),
                focusColor: Colors.blue,
                onPressed: (){
                    reset();
                },
                )
            ),
            Expanded(
            flex: 4,
              child: Center(
                child: Text(quizBrain.getQuestionText(questionNum<quizBrain.getQsize()?
                  questionNum:quizBrain.getQsize()-1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Expanded(
            flex:1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: (){
                    checkAnswer(true);
                    },
                    child: Text('True',
                    style: TextStyle(
                    color: Colors.white
                    ),),
                    disabledColor: Colors.green,
                    color: Colors.green,
                    textColor: Colors.white,
                    ),
                    ),
                    ),
                    ),
                    Expanded(
                    flex: 1,
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                    onPressed: (){
                        checkAnswer(false);
                        },
                    child: Text('False',
                    style: TextStyle(
                    color: Colors.white
                    ),
                  ),
                  disabledColor: Colors.red,
                  color: Colors.red,
                  textColor: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: scoreKeeper,
              ),
            )
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
