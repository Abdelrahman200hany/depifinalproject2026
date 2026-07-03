import 'package:depifinalproject/feature/main_view/domain/use_case/navigation_role_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<List<Widget>> {
  final GetMainScreensUseCase useCase;

  MainCubit(this.useCase) : super([]);

  List<Widget> loadScreens() {
    final screens = useCase();
    emit(screens);
    return screens;
  }
}
