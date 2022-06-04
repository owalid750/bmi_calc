import 'package:bmi_cal/bmi_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiStates> {
  BmiCubit() : super(BmiInitialState());

  static BmiCubit get(context) => BlocProvider.of(context);
   bool isDark = false;
   
  void changeMode() {
    isDark = !isDark;
    emit(BmiChangeMode());
  }
}
