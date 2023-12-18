import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/onbording/data/models/on_bording_model.dart';
import 'package:smartsoil/Feature/onbording/data/repositories/onbording_repo.dart';

part 'onbording_state.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  final OnBoardingRepo onBoardingRepo;

  OnbordingCubit({required this.onBoardingRepo}) : super(OnbordingInitial());

  bool isLastBoarding = false;
  List<OnBordingModel> onBoardingPages() {
    return onBoardingRepo.onBoardingPages();
  }

  int? index;
  void onChangePageIndex(index) {
    if (index == onBoardingPages().length - 1) {
      isLastBoarding = true;
    } else {
      isLastBoarding = false;
    }
    emit(PageViewIndexChangedState());
  }

  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
  }) {
    onBoardingRepo.navigateBetweenPages(
      context: context,
      pageController: pageController,
      isLastBoarding: isLastBoarding,
    );

    emit(NavigateBetweenPages());
  }

  void navigateToLoginOrHome({required BuildContext context}) {
    // if (onBording != null) {
    //   if (token != null) {
    //   } else {
    //     context.pushNamedAndRemoveUntil(
    //       Routes.authViewRoute,
    //       routePredicate: (route) => false,
    //     );
    //   }
    // }

    onBoardingRepo.navigateToAuth(context: context);

    emit(SkipToSignInOrHome());
  }
}
