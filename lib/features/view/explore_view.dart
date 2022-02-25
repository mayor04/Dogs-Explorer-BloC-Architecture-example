import 'package:dog_app/core/constant/colors.dart';
import 'package:dog_app/core/utils/extension.dart';
import 'package:dog_app/services/navigation_services.dart';
import 'package:dog_app/widget/box_spacing.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(26, 30, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 10),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.searchFill,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.searchBorder),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
                child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 26,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 196,
                  ),
                  itemBuilder: (_, index) {
                    return const DogItemBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DogItemBox extends StatelessWidget {
  const DogItemBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService().navigateToDetailsView();
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Placeholder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 3, 0, 0),
              child: Text(
                'Name',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 0, 13),
              child: Text(
                'breed: 3',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
