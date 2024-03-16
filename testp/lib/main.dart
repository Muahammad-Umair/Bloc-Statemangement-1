import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testp/switch_bloc.dart';
import 'package:testp/switch_event.dart';
import 'package:testp/switch_state.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SwitchBloc>(
      create: (context) => SwitchBloc(),
      child: MaterialApp(
        title: "Test App",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Test Flutter App"),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.isSwitchOff!= current.isSwitchOff,

                  builder: (context, state) {
                    print("Switch value changed again++++++++++++++++++++++++++++");
                    return

                      Switch(value: state.isSwitchOff, onChanged: (value) {
                        context.read<SwitchBloc>().add(notificationToggle());
                      },); }),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.sliderValue!= current.sliderValue,

                  builder: (context, state) {
                    print("Slider value increase again=======");

                    return Container(height: 200,
                      width: double.infinity,
                      color: Colors.red.withOpacity(state.sliderValue),
                    );
                  },
                ),

                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.sliderValue!= current.sliderValue,
                  builder: (context, state) {
                    print("Slider is build again=======");
                    return Slider(value: state.sliderValue, onChanged: (value) {
                      context.read<SwitchBloc>().add(SliderValueEvent(sliderValue: value));
                    },);
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
