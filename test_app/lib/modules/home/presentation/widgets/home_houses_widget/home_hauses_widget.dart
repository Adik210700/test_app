import 'package:flutter/material.dart';
import 'package:test_app/core/constans/app_dimensions.dart';
import 'package:test_app/core/extension/double_extension.dart';

import 'package:test_app/modules/home/presentation/widgets/home_houses_widget/home_house_element_widget.dart';

class HomeHausesWidget extends StatelessWidget {
  const HomeHausesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          HomeHouseElementWidget(
            name: 'Gryffindor',
            image:
                'https://static.wikia.nocookie.net/maraudersharrypotter/images/2/27/Gryffindorlogo.webp/revision/latest?cb=20240328234640',
          ),
          AppDimensions.largePaddinf.horizontalSpace,
          HomeHouseElementWidget(
            name: 'Hufflepuff',
            image:
                'https://m.media-amazon.com/images/I/61NgUEEdT5L._AC_UF894,1000_QL80_.jpg',
          ),
          AppDimensions.largePaddinf.horizontalSpace,
          HomeHouseElementWidget(
            name: 'Ravenclaw',
            image:
                'https://cdn.shopify.com/s/files/1/1541/8579/files/Ravenclaw-harry_potter_large.jpg?v=1491539507',
          ),
          AppDimensions.largePaddinf.horizontalSpace,
          HomeHouseElementWidget(
            name: 'Slytherin',
            image:
                'https://fiveoclockshadow.life/wp-content/uploads/2020/11/slytherin_wallpaper_by_dragonlover28-d45jhse.jpg',
          ),
        ],
      ),
    );
  }
}
