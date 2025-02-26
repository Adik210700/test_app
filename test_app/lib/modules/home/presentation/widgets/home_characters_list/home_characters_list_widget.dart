import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/constans/app_dimensions.dart';
import 'package:test_app/core/enum/hogearts_house.dart';
import 'package:test_app/core/extension/context_extension.dart';
import 'package:test_app/core/extension/double_extension.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/theme/app_textstyles.dart';
import 'package:test_app/modules/home/presentation/bloc/fetch_all_characters_bloc.dart';
import 'package:test_app/modules/home/presentation/widgets/home_characters_list/home_characters_list_element_widget.dart';
import 'package:test_app/modules/profile/pressentation/profile_details_screen.dart';

class HomeCharactersListWidget extends StatefulWidget {
  const HomeCharactersListWidget({super.key});

  @override
  State<HomeCharactersListWidget> createState() =>
      _HomeCharactersListWidgetState();
}

class _HomeCharactersListWidgetState extends State<HomeCharactersListWidget> {
  @override
  void initState() {
    context.read<FetchAllCharactersBloc>().add(
          FetchAllCharactersEvent(
            house: HogeartsHouse.unknown,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllCharactersBloc, AppState>(
        builder: (context, state) {
      if (state is LoadingState) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.textColor,
          ),
        );
      }
      if (state is SuccessState) {
        return ListView.separated(
            padding:
                EdgeInsets.symmetric(horizontal: AppDimensions.mediumPaddinf),
            separatorBuilder: (context, index) =>
                AppDimensions.largePaddinf.verticalSpace,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.characters.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () => context.push(
                    ProfileDetailsScreen(
                      house:
                          getHouseName(state.characters[index].hogwartsHouse),
                      character: state.characters[index],
                    ),
                  ),
                  child: HomeCharactersListElementWidget(
                      character: state.characters[index]),
                ));
      }
      return Center(
        child: Text(
          'No data',
          style: AppTextstyles.bodyRegular
              .copyWith(color: AppColors.textColor, fontSize: 18),
        ),
      );
    });
  }

  HogeartsHouse getHouseName(String house) {
    switch (house) {
      case 'Gryffindor':
        return HogeartsHouse.gryffindor;

      case 'Hufflepuff':
        return HogeartsHouse.hufflepuff;

      case 'Ravenclaw':
        return HogeartsHouse.ravenclaw;

      case 'Slytherin':
        return HogeartsHouse.slytherin;

      default:
        return HogeartsHouse.unknown;
    }
  }
}
