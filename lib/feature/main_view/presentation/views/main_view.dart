import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/main_view/domain/use_case/navigation_role_use_case.dart';
import 'package:depifinalproject/feature/main_view/presentation/manager/main_view_cubit/main_view_cubit.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName = 'mainview';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(getIt.get<GetMainScreensUseCase>()),
      child: const MainViewBody(),
    );
  }
}
