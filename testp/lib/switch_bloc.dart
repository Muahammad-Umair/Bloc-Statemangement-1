
import 'package:bloc/bloc.dart';

import 'package:testp/switch_event.dart';

import 'switch_state.dart';



class SwitchBloc extends Bloc<SwitchEvent, SwitchState>{
  SwitchBloc(): super( SwitchState()){
    on<notificationToggle>(toggleFunction);
    on<SliderValueEvent>(trackSliderValue);
  }
  void toggleFunction(SwitchEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(switchValue: !state.isSwitchOff));
  }

  void trackSliderValue(SliderValueEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(value: event.sliderValue));
  }

}
