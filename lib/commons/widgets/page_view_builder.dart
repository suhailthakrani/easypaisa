import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  final List<Widget> children;

  const MyPageView({Key? key, required this.children}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          children: widget.children,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: PageViewIndicator(
            count: widget.children.length,
            currentIndex: _currentPage,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class PageViewIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const PageViewIndicator({
    Key? key,
    required this.count,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentIndex ? Colors.green : Colors.grey,
            ),
          ),
        );
      }),
    );
  }
}
