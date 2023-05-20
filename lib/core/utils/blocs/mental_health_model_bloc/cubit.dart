import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/network/remote/dio_helper.dart';
import 'package:mentlo/core/utils/blocs/mental_health_model_bloc/states.dart';

class MentalHealthBloc extends Cubit<MentalHealthStates> {
  MentalHealthBloc() : super(MentalHealthInitial());

  static MentalHealthBloc get(context) => BlocProvider.of(context);


  void getModelData(){
    DioHelper.postData(
        url: 'http://127.0.0.1:5000',
        query: {
          'input' : ['i am not feeling good", "nobody loves me", "my friends hate me", "I hate my job'],
        },
      data: {
        'input' : ['i am not feeling good", "nobody loves me", "my friends hate me", "I hate my job'],
      },
    ).then((value) {
      debugPrint(value.data);
      debugPrint('success');
      emit(MentalHealthSuccess());
    }).catchError((error){
      emit(MentalHealthError(error.toString()));
    });
  }
}