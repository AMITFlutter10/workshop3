
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop3/bloc/counter_state.dart';
import 'package:workshop3/local/sheard.dart';
import 'package:workshop3/utilities/enums.dart';

class CounterCubit extends Cubit<AppState>{
  CounterCubit() :super(InitState());

static  CounterCubit get(context)=> BlocProvider.of(context);

  int counter = 0;
  void incrementCounter() {
    counter++;
   emit(ChangeCounterState());
  }


  bool isDarkTheme= false;
  void changeAppTheme(){
    isDarkTheme = !isDarkTheme;
   MyCache.putBoolean(key: MySharedKeys.keyTheme, value: isDarkTheme);
    emit(ChangeThemeState());
  }

  void getTheme(){
    isDarkTheme= MyCache.getBoolean(key: MySharedKeys.keyTheme);
  }




}