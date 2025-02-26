import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/constans/app_dimensions.dart';
import 'package:test_app/core/enum/hogearts_house.dart';
import 'package:test_app/core/extension/double_extension.dart';
import 'package:test_app/modules/home/presentation/bloc/fetch_all_characters_bloc.dart';
import 'package:test_app/modules/home/presentation/provider/home_bg_provider.dart';

import 'package:test_app/modules/home/presentation/widgets/home_houses_widget/home_house_element_widget.dart';

class HomeHausesWidget extends StatefulWidget {
  const HomeHausesWidget({super.key});

  @override
  State<HomeHausesWidget> createState() => _HomeHausesWidgetState();
}

class _HomeHausesWidgetState extends State<HomeHausesWidget> {
  final _selectedHouse = ValueNotifier<HogeartsHouse?>(null);
  @override
  void dispose() {
    _selectedHouse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ValueListenableBuilder(
          valueListenable: _selectedHouse,
          builder: (context, value, child) {
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                HomeHouseElementWidget(
                  activeColor: Colors.redAccent,
                  isActive: _selectedHouse.value == HogeartsHouse.gryffindor,
                  onTap: () => _onHouseTap(HogeartsHouse.gryffindor),
                  name: 'Gryffindor',
                  image:
                      'https://static.wikia.nocookie.net/maraudersharrypotter/images/2/27/Gryffindorlogo.webp/revision/latest?cb=20240328234640',
                ),
                AppDimensions.largePaddinf.horizontalSpace,
                HomeHouseElementWidget(
                  activeColor: Colors.orangeAccent,
                  isActive: _selectedHouse.value == HogeartsHouse.hufflepuff,
                  onTap: () => _onHouseTap(HogeartsHouse.hufflepuff),
                  name: 'Hufflepuff',
                  image:
                      'https://m.media-amazon.com/images/I/61NgUEEdT5L._AC_UF894,1000_QL80_.jpg',
                ),
                AppDimensions.largePaddinf.horizontalSpace,
                HomeHouseElementWidget(
                  activeColor: Colors.blueAccent,
                  isActive: _selectedHouse.value == HogeartsHouse.ravenclaw,
                  onTap: () => _onHouseTap(HogeartsHouse.ravenclaw),
                  name: 'Ravenclaw',
                  image:
                      'https://cdn.shopify.com/s/files/1/1541/8579/files/Ravenclaw-harry_potter_large.jpg?v=1491539507',
                ),
                AppDimensions.largePaddinf.horizontalSpace,
                HomeHouseElementWidget(
                  activeColor: Colors.greenAccent,
                  isActive: _selectedHouse.value == HogeartsHouse.slytherin,
                  onTap: () => _onHouseTap(HogeartsHouse.slytherin),
                  name: 'Slytherin',
                  image:
                      'https://fiveoclockshadow.life/wp-content/uploads/2020/11/slytherin_wallpaper_by_dragonlover28-d45jhse.jpg',
                ),
              ],
            );
          }),
    );
  }

  void _onHouseTap(HogeartsHouse house) {
    context.read<HomeBgProvider>().changeBgColot(house.color);
    if (_selectedHouse.value == house) {
      _selectedHouse.value = null;
      context.read<FetchAllCharactersBloc>().add(
            FetchAllCharactersEvent(house: HogeartsHouse.unknown),
          );
    } else {
      _selectedHouse.value = house;
      context.read<FetchAllCharactersBloc>().add(
            FetchAllCharactersEvent(house: house),
          );
    }
  }
}
