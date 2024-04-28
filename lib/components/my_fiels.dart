import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/responsive.dart';
import 'package:saiey/models/my_files.dart';

import '../../../constants.dart';
import 'file_info_card.dart';

class MyFiels extends StatelessWidget {
  const MyFiels({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: MyFilesGridView(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 ? 1.3 : 1,
            // childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
           tablet: MyFilesGridView(
            crossAxisCount: size.width < 850 ? 2 : 4,
            childAspectRatio: size.width < 850 ? 1.3 : 1,
            // childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
          desktop: MyFilesGridView(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
        )
      ],
    );
  }
}

class MyFilesGridView extends StatelessWidget {
  const MyFilesGridView({super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: demoMyFiels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: defaultPadding,
        crossAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiels[index]),
    );
  }
}
