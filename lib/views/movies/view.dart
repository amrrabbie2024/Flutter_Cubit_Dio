import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_dio/core/logic/helper_methods.dart';
import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';

import '../../features/movies/cubit.dart';

part 'compoents/movies.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Movies list"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 24),
        child: MoviesSection(),
      ),
    );
  }
}
