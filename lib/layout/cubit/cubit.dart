import 'package:bmi_cal/layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  bool isMale = true;
  double heigth = 120;
  int age = 19;
  int weigth = 60;
  var result = 0;
 
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  toggle1() {
    isMale = !isMale;
    emit(AppToggleColorState());
  }

  onChangeHeight(val) {
    heigth = val;
    emit(AppChangeHeightState());
  }

  onAddAge() {
    age++;
    emit(AppAddAgeState());
  }

  onRemoveAge() {
    age--;
    emit(AppRemoveAgeState());
  }

  onAddWeight() {
    weigth++;
    emit(AppAddWeightState());
  }

  onRemoveWeight() {
    weigth--;
    emit(AppRemoveWeightState());
  }

}
