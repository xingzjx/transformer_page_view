// import 'package:flutter/material.dart';
//
// // import 'package:example/buildin_transformers.dart';
// import 'package:flutter/material.dart';
//
// // import 'package:transformer_page_view/transformer_page_view.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:transformer_page_view/transformer_page_view.dart';
//
// // 1111111 !!!!!!
//
// void main() => runApp(new MyApp());
// List<Color> list = [Colors.yellow, Colors.green, Colors.blue];
//
// List<String> images = [
//   "assets/Hepburn2.jpg",
//   "assets/Hepburn5.jpg",
//   "assets/Hepburn4.jpg",
// ];
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(primarySwatch: Colors.blue),
//       home: new MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({required this.title});
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }
//
// class TestWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Color> list = [
//       Colors.redAccent,
//       Colors.blueAccent,
//       Colors.greenAccent,
//     ];
//     return TransformerPageView(
//       loop: true,
//       transformer: new ScaleAndFadeTransformer(),
//       viewportFraction: 0.8,
//       itemBuilder: (BuildContext context, int index) {
//         return new Container(
//           color: list[index % list.length],
//           child: new Center(
//             child: new Text(
//               "$index",
//               style: new TextStyle(fontSize: 80.0, color: Colors.white),
//             ),
//           ),
//         );
//       },
//       itemCount: 3,
//       key: Key('test'),
//       index: 0,
//       duration: Duration(),
//       physics: QuickerScrollPhysics(),
//       onPageChanged: (int value) {},
//       controller: IndexController(),
//       pageController: TransformerPageController(itemCount: 3),
//     );
//   }
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(body: new TestWidget());
//   }
// }
//
// class ScaleAndFadeTransformer extends PageTransformer {
//   final double _scale;
//   final double _fade;
//
//   ScaleAndFadeTransformer({double fade = 0.3, double scale = 0.8})
//     : _fade = fade,
//       _scale = scale;
//
//   @override
//   Widget transform(Widget item, TransformInfo info) {
//     double position = info.position;
//     double scaleFactor = (1 - position.abs()) * (1 - _scale);
//     double fadeFactor = (1 - position.abs()) * (1 - _fade);
//     double opacity = _fade + fadeFactor;
//     double scale = _scale + scaleFactor;
//     return new Opacity(
//       opacity: opacity,
//       child: new Transform.scale(scale: scale, child: item),
//     );
//   }
// }
//
// class QuickerScrollPhysics extends BouncingScrollPhysics {
//   const QuickerScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);
//
//   @override
//   QuickerScrollPhysics applyTo(ScrollPhysics? ancestor) {
//     return QuickerScrollPhysics(parent: buildParent(ancestor));
//   }
//
//   @override
//   SpringDescription get spring => SpringDescription.withDampingRatio(
//     mass: 0.2,
//     stiffness: 300.0,
//     ratio: 1.1,
//   );
// }
