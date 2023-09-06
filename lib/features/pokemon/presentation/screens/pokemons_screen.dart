import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_app/core/components/custom_loading.dart';
import 'package:pokemon_app/core/network/server_info.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/arguments_poken_detail.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/pokemon_card.dart';
import 'package:pokemon_app/injection_container.dart';

import '../../../../core/components/custom_dialog_box.dart';
import '../../../../core/routes/resource_icons.dart';
import 'pekemon_detail_screen.dart';

class PokemonsScreen extends StatefulWidget {
  const PokemonsScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<PokemonsScreen> createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  PokemonBloc pokemonBloc = getIt<PokemonBloc>();
  List<PokemonEntity> listPokemons = [];

  @override
  void initState() {
    super.initState();
    pokemonBloc.add(GetPokemonsInfoEvent());
    _scrollController.addListener(() {
      if (!_isLoading && _scrollController.position.extentAfter == 0.0) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Poke APP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: BlocProvider.value(
        value: pokemonBloc,
        child: BlocConsumer<PokemonBloc, PokemonState>(
          listener: (context, state) {
            if (state is LoadingGetPokemonInfoState) {
              _isLoading = true;
            }
            if (state is FailedGetPokemonInfoState) {
              _isLoading = false;
              _errorMessage(state.error);
            }
            if (state is SuccessGetPokemonInfoState) {
              _isLoading = false;
              listPokemons = state.listPokemonEntity;
            }
          },
          builder: (context, state) {
            return Stack(children: [
              _principalBody(),
              Visibility(
                visible: _isLoading,
                child: const CustomLoadingScreen(),
              )
            ]);
          },
        ),
      )),
    );
  }

  Widget _principalBody() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (listPokemons.isNotEmpty) {
                  var item = listPokemons[index];

                  return PokemonCard(
                      id: item.id,
                      image: getPokemonImage(item.id),
                      color: item.color,
                      name: item.name,
                      onTap: () {
                        ArgumentsPokemonDetailScreen
                            paramsPokemonDetailUseCase =
                            ArgumentsPokemonDetailScreen(
                          pokemonName: item.name,
                          pokemonBloc: pokemonBloc,
                        );
                        Navigator.pushNamed(
                            context, PokemonDetailScreen.routeName,
                            arguments: paramsPokemonDetailUseCase);
                      });
                } else {
                  return const CustomLoadingScreen();
                }
              },
              childCount: listPokemons.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2))
      ],
    );
  }

  Future<void> _errorMessage(String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogBox(
          icon: SvgPicture.asset(warningModalSVG),
          title: '!Lo lamentamos',
          descriptions: message,
          confirmText: 'Aceptar',
          onAccept: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
