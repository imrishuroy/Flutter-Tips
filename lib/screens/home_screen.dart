import 'package:flutter/material.dart';
import 'package:flutter_tips/widgets/custom_button.dart';
import '/screens/image-tint/image_tint.dart';
import 'slide-transition/slide_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      appBar: AppBar(
        title: const Text('HomeScree'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10.0),
            CustomButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ImageTint(),
                ),
              ),
              label: 'Image Tint',
            ),
            const SizedBox(height: 10.0),
            CustomButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SlideTransitonExample(),
                ),
              ),
              label: 'Slide Transition',
            )
          ],
        ),
      ),
    );
  }
}
