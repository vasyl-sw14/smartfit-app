import 'package:flutter_bloc/flutter_bloc.dart';

class TabsCubit extends Cubit<int> {
  TabsCubit() : super(1);

  void changeTab(int index) => emit(index);
}
