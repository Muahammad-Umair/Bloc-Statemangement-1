


import 'package:equatable/equatable.dart';

class  SwitchState extends Equatable {
  bool isSwitchOff;
  double sliderValue;

  SwitchState({this.isSwitchOff=true, this.sliderValue =0.0 });

  SwitchState copyWith({bool? switchValue, double? value}){
    return SwitchState(isSwitchOff: switchValue?? isSwitchOff, sliderValue: value?? this.sliderValue);
  }

  @override
  List<Object?> get props =>[isSwitchOff, sliderValue];


}
