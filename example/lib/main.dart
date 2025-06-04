import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('PageView Stack Effect')),
        body: StackedPageView(),
      ),
    );
  }
}

class StackedPageView extends StatefulWidget {
  @override
  _StackedPageViewState createState() => _StackedPageViewState();
}

class _StackedPageViewState extends State<StackedPageView>
    with SingleTickerProviderStateMixin {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: PageView.builder(
        controller: _controller,
        itemCount: 10, // 假设有10张图片
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              // 前一张图片（偏移显示）
              if (index > 0)
                Positioned(
                  left: -0.3 * MediaQuery.of(context).size.width,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.network(
                      'https://picsum.photos/400/600?random=$index',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              // // 后一张图片（偏移显示）
              if (index < 9)
                Positioned(
                  right: -0.3 * MediaQuery.of(context).size.width,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.network(
                      'https://picsum.photos/400/600?random=${index + 2}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              // 当前图片
              Align(
                alignment: Alignment.center,
                child: Image.network(
                'https://picsum.photos/400/600?random=${index + 1}',
                fit: BoxFit.fill,
              ),),
            ],
          );
        },
        onPageChanged: (int index) {
          // 可以在这里添加动画效果
        },
      ),
    );
  }
}
