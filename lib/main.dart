import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 200,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Dismissible(
              
              key: UniqueKey(),

              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(24.0),
                // padding: EdgeInsets.only(left:24.0),
                child: Icon(Icons.phone),
              ),
              secondaryBackground: Container(
                color: Colors.black,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right:24.0),
                child: Icon(
                  Icons.sms,
                  color: Colors.white,
                ),
              ),
              onDismissed: (direction){//左滑還是右滑
                print(direction);
                if (direction == DismissDirection.startToEnd){
                  print("phone");
                }
              },
              onResize: (){
                print("onResize");
              },
              direction: DismissDirection.vertical,
              resizeDuration: Duration(seconds: 5),
              movementDuration:  Duration(seconds: 5),//看使用者滑動的程度（默認是40%）, 決定要完成什麼事件
              dismissThresholds: {
                DismissDirection.startToEnd:0.1,//左到右
                DismissDirection.endToStart:0.99,//右到左
              },//默認是40%
              confirmDismiss: (direction) async {
                await Future.delayed(Duration(seconds: 2));
                return true;// 決定是否真的要刪除
              },
              child: Container(
                // height: 72,
                width: 72,
                color: Colors.blue[index % 9 * 100],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
