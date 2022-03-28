import 'package:dog_app/core/constant/images.dart';
import 'package:dog_app/core/utils/extension.dart';
import 'package:dog_app/services/navigation_services.dart';
import 'package:dog_app/widget/box_spacing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Box.vertical(30),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.logo),
                  const Box.horizontal(10),
                  Text(
                    'DogApp',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            const Box.vertical(30),
            Expanded(
              flex: 10,
              child: Container(
                // color: Colors.blue,
                margin: const EdgeInsets.all(40),
                child: Image.asset(AppImages.intro),
              ),
            ),
            Container(
              width: 250,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              // color: Colors.yellow,
              child: Text(
                'Start exploring different breeds of dogs all around the world',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              // color: Colors.green,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(60, 30, 60, 30),
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/explore');
                  },
                  child: const Center(
                    child: Text('EXPLORE'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
