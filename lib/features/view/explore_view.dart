import 'package:dog_app/core/constant/colors.dart';
import 'package:dog_app/core/utils/extension.dart';
import 'package:dog_app/data_layer/models/breed_data_model.dart';
import 'package:dog_app/features/bloc/explore_list_bloc/explore_list_bloc.dart';
import 'package:dog_app/services/navigation_services.dart';
import 'package:dog_app/widget/box_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                child: BlocBuilder<ExploreListBloc, ExploreListState>(
                    builder: (context, state) {
                  if (state.status == ExploreListStatus.initial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return GridView.builder(
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 26,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 196,
                    ),
                    itemBuilder: (_, index) {
                      return DogItemBox(breedData: state.breedList[index]);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DogItemBox extends StatelessWidget {
  final BreedDataModel breedData;
  const DogItemBox({Key? key, required this.breedData}) : super(key: key);

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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      breedData.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return Container(
                          color: Colors.red,
                        );
                      },
                      errorBuilder: (_, a, b) => Container(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 3, 0, 0),
              child: Text(
                breedData.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 0, 13),
              child: Text(
                'breed: ${breedData.subBreedCount}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
