import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/explor_view_body.dart';
import 'package:smartsoil/core/Di/service_locator.dart';

class ExplorView extends StatelessWidget {
  const ExplorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<ExplorCubit>(),
      child: const Scaffold(
        body: ExplorViewBody(),
      ),
    );
  }
}
