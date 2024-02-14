import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return const Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('Home body')],
          ),
        );
      },
    );
  }
}
