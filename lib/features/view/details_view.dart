import 'package:dog_app/core/constant/colors.dart';
import 'package:dog_app/widget/box_spacing.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                //TODO: use custom delegate to handle
                SliverAppBar(
                  title: Text(
                    'Title',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  flexibleSpace: const FlexibleSpaceBar(
                    background: Placeholder(
                      color: Colors.grey,
                    ),
                  ),
                  pinned: true,
                  actions: const [
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: Icon(Icons.bookmark_add_outlined),
                    ),
                  ],
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                    size: 28,
                  ),
                  centerTitle: true,
                  expandedHeight: 250,
                  collapsedHeight: kToolbarHeight,
                  // backgroundColor: Colors.white,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      children: const [
                        Box.vertical(28),
                        _ThreeImage(),
                        Box.vertical(28),
                        _ItemHeader(headerTitle: 'Description'),
                        _ItemHeader(headerTitle: 'Sub breed'),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(height: 100),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => const DogImage(),
                      childCount: 30,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 70,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const _BottomItemButton(),
        ],
      ),
    );
  }
}

class DogImage extends StatelessWidget {
  const DogImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: const Placeholder(
        color: Colors.blue,
      ),
    );
  }
}

class _ThreeImage extends StatelessWidget {
  const _ThreeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        imageBox(),
        const Box.vertical(11),
        imageBox(),
        const Box.vertical(11),
        imageBox(),
      ],
    );
  }

  Widget imageBox() {
    return const SizedBox(
      height: 52,
      width: 54,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Placeholder(),
        ),
      ),
    );
  }
}

class _ItemHeader extends StatelessWidget {
  final String headerTitle;

  const _ItemHeader({
    Key? key,
    required this.headerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Box.vertical(6),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            headerTitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const Box.vertical(6),
        const Divider(),
      ],
    );
  }
}

class _BottomItemButton extends StatelessWidget {
  const _BottomItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 96,
      color: Colors.white,
      child: Column(
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: ElevatedButton(
              onPressed: () {},
              child: const Center(
                child: Text('EXPLORE'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
