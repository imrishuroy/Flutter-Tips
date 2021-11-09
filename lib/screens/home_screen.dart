import 'package:flutter/material.dart';
import 'package:flutter_tips/screens/crud-app/crud_app.dart';
import 'package:flutter_tips/screens/sqlite-storage/sqlite_storage.dart';
import 'package:flutter_tips/widgets/custom_button.dart';
import '/screens/image-tint/image_tint.dart';
import 'expansion-lists/expansion_lists.dart';
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
            ),
            const SizedBox(height: 10.0),
            CustomButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ExpansionList(),
                ),
              ),
              label: 'Expansion List',
            ),
            const SizedBox(height: 10.0),
            CustomButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CrudApp(),
                ),
              ),
              label: 'CrudApp',
            ),
            const SizedBox(height: 10.0),
            CustomButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SqliteStorage(),
                ),
              ),
              label: 'SqliteStorage',
            )
          ],
        ),
      ),
    );
  }
}
