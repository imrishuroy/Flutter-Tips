// https://raw.githubusercontent.com/vandadnp/flutter-tips-and-tricks/main/images/slidetransition-in-flutter.jpg

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SlideTransitonExample extends StatefulWidget {
  const SlideTransitonExample({Key? key}) : super(key: key);

  @override
  _SlideTransitonExampleState createState() => _SlideTransitonExampleState();
}

class _SlideTransitonExampleState extends State<SlideTransitonExample>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final _animation = Tween<Offset>(
    begin: const Offset(0.0, 0.0),
    end: const Offset(-0.83, 0.0),
    // based on the animation controller
    //  create  a Tween<offset> that moves our object left and right
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInQuint,
    ),
  );

  var _isExpanded = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      body: SizedBox.expand(
        // it takes the entire space from its parent
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.network(
              'https://bit.ly/3BWYDbz',
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              top: 200.0,
              child: SlideTransition(
                position: _animation,
                child: GestureDetector(
                  onTap: () {
                    _isExpanded = !_isExpanded;
                    if (_isExpanded) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  },
                  child: const Box(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[200]?.withAlpha(200),
        border: Border.all(
          color: Colors.blue,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Text(
              'By: Jesper Anhede',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Icon(
              Icons.info,
              color: Colors.pink[400],
            ),
          ],
        ),
      ),
    );
  }
}
