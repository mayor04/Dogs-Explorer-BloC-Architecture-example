import 'package:dog_app/core/constant/colors.dart';
import 'package:dog_app/core/utils/extension.dart';
import 'package:dog_app/data_layer/models/breed_data_model.dart';
import 'package:dog_app/data_layer/remote_api/details_scapper.dart';
import 'package:dog_app/features/bloc/explore_list_bloc/explore_list_bloc.dart';
import 'package:dog_app/services/navigation_services.dart';
import 'package:dog_app/widget/box_spacing.dart';
import 'package:dog_app/widget/breed_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(26, 25, 22, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Icon(Icons.menu),
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
                padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                child: BlocBuilder<ExploreListBloc, ExploreListState>(
                  builder: (context, state) {
                    if (state.status == ExploreListStatus.error) {
                      return Center(
                        child: Text(
                          'Unable to retrieve Dog List',
                          style: context.textTheme.bodyMedium,
                        ),
                      );
                    }

                    return GridView.builder(
                      itemCount: state.count,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 195,
                      ),
                      itemBuilder: (_, index) {
                        if (state.status == ExploreListStatus.initial) {
                          return Shimmer.fromColors(
                            baseColor: AppColors.shimmerBase,
                            highlightColor: AppColors.shimmerHighlight,
                            enabled: state.status == ExploreListStatus.initial,
                            child: Container(
                              color: AppColors.shimmerBg,
                            ),
                          );
                        }

                        return DogItemBox(breedData: state.breedAt(index));
                      },
                    );
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
  final BreedDataModel? breedData;
  const DogItemBox({Key? key, required this.breedData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (breedData == null) return;
        NavigationService().navigateToDetailsView(breedData!);
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: NetworkImageBox(url: breedData?.imageUrl),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 3, 0, 0),
              child: Text(
                breedData?.name ?? '',
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 4, 0, 13),
              child: Text(
                'sub-breed: ${breedData?.subBreedCount ?? ''}',
                style:
                    context.textTheme.labelSmall?.copyWith(letterSpacing: 1.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
