import  'package:equatable/equatable.dart';



abstract class SwitchEvent extends Equatable {
  @override
  List<Object> get props=>[];
}

class notificationToggle extends SwitchEvent{}

class SliderValueEvent extends SwitchEvent {
  final double sliderValue;
  SliderValueEvent({required this.sliderValue});

}
