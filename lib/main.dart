import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("hello world"),
      ),
      body: Container(
        child: MyRenderBoxWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _MyRenderBox extends RenderBox{

  @override
  bool hitTest(HitTestResult result, {Offset position}) {
    // TODO: implement hitTest
    return true;
  }

@override
  void debugPaint(PaintingContext context, Offset offset) {
    // TODO: implement debugPaint
    Canvas c = context.canvas;
    int dx = offset.dx.toInt();
    int dy = offset.dy.toInt();
    Paint p = Paint()
    ..style = PaintingStyle.fill
    ..color = Color.fromARGB(150, 0, 200, 255);

    Rect r = Rect.fromLTWH(dx + 50.0, dy + 50.0, 150, 150);
    c.drawRect(r, p);

    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(150, 200, 0, 255);
    p.strokeWidth = 10;
    r = Rect.fromLTWH(dx + 150.0, dy + 200.0, 150, 150);
    c.drawRect(r, p);

  }
}



class MyRenderBoxWidget extends SingleChildRenderObjectWidget{
  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MyRenderBox();
  }
}








