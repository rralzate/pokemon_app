import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';

import '../../../../core/components/custom_dialog_box.dart';
import '../../../../core/components/custom_loading.dart';
import '../../../../core/network/server_info.dart';
import '../../../../core/routes/resource_icons.dart';
import '../../domain/entities/detail/species.dart';
import '../../domain/entities/arguments_poken_detail.dart';
import '../bloc/pokemon_bloc.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({
    Key? key,
    required this.paramPokemonDetail,
  }) : super(key: key);

  static const routeName = '/pokemon-detail';

  final ArgumentsPokemonDetailScreen paramPokemonDetail;

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  bool _isLoading = false;
  PokemonDetailEntity pokemonDetailEntity = PokemonDetailEntity(
    abilities: [],
    baseExperience: 0,
    forms: [],
    gameIndices: [],
    height: 0,
    heldItems: [],
    id: 0,
    isDefault: false,
    locationAreaEncounters: '',
    moves: [],
    name: '',
    order: 0,
    pastTypes: [],
    species: Species(name: '', url: ''),
    stats: [],
    types: [],
    weight: 0,
  );

  @override
  void initState() {
    super.initState();
    widget.paramPokemonDetail.pokemonBloc.add(GetPokemonDetailInfoEvent(
        pokemonName: widget.paramPokemonDetail.pokemonName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Poke Detail',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: BlocProvider.value(
        value: widget.paramPokemonDetail.pokemonBloc,
        child: BlocConsumer<PokemonBloc, PokemonState>(
          listener: (context, state) {
            if (state is LoadingGetPokemonDetailState) {
              _isLoading = true;
            }
            if (state is FailedGetPokemonDetailState) {
              _errorMessage(state.error);
              _isLoading = false;
            }
            if (state is SuccessGetPokemonDetailState) {
              pokemonDetailEntity = state.pokemonDetailEntity;
              _isLoading = false;
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

  Widget _principalBody() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Card(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Hero(
                  tag: 'Pokemon-${pokemonDetailEntity.id}',
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      getPokemonImage(
                        pokemonDetailEntity.id,
                      ),
                    ),
                  ),
                ),
                Text(
                  pokemonDetailEntity.name,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
