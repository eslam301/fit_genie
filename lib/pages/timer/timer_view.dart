
import 'package:fitgenie/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> with TickerProviderStateMixin {
  late final TimerController _timerController;
  final selectedTime = TextEditingController();
  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isRunning = false;
    bool isOver = false;
    return Column(children: [
      const Text('Timer', style: TextStyle(color: Colors.white, fontSize: 32)),

      GestureDetector(
        onTap: () {
          if (isRunning == true) {
            _timerController.pause();
            isRunning = false;
          } else if (isRunning == false) {
            _timerController.start();
            isRunning = true;
          }
        },
        onDoubleTap: () {
          _timerController.reset();
          isOver = false;
          isRunning = false;
        },
        onLongPress: () {
          openBottomSheet(context, _timerController,selectedTime);
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SimpleTimer(

            strokeWidth: 20,
            delay: const Duration(seconds: 0),
            controller: _timerController,
            onEnd: () {
              isOver = true;
              isRunning = false;
            },
            onStart: () {
              isOver = false;
              isRunning = true;
            },
            timerStyle: TimerStyle.expanding_sector,
            progressTextCountDirection:
                TimerProgressTextCountDirection.count_down,
            duration: const Duration(seconds: 20),
            progressTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: () {
              _timerController.start();
              isRunning = true;
            },
            style: FilledButton.styleFrom(
                backgroundColor: Colors.green, fixedSize: const Size(150, 50)),
            child: const Text(
              'Start',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 20),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                fixedSize: const Size(150, 50)),
            onPressed: () {
              _timerController.reset();
              isRunning = false;
              isOver = false;
            },
            child: const Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            style: FilledButton.styleFrom(
                foregroundColor: Colors.white, fixedSize: const Size(150, 50)),
            onPressed: () {
              _timerController.pause();
              isRunning = false;
            },
            child: const Text(
              'Pause',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 20),
          FilledButton(
            style: FilledButton.styleFrom(
                foregroundColor: Colors.white, fixedSize: const Size(150, 50)),
            onPressed: () {
              _timerController.restart();
              isRunning = true;
              isOver = false;
            },
            child: const Text(
              'Restart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilledButton(
            style: FilledButton.styleFrom(
                foregroundColor: Colors.white, fixedSize: const Size(50, 30)),
            onPressed: () {
              _timerController.subtract(const Duration(seconds:5));
              _timerController.start();
              isRunning = true;
            },
            child: const Text(
              '-5',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                foregroundColor: Colors.white, fixedSize: const Size(150, 50)),
            onPressed: () {
              openBottomSheet(context, _timerController, selectedTime);
            },
            child: const Text(
              'Set Time',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                foregroundColor: Colors.white, fixedSize: const Size(50, 30)),
            onPressed: () {
              _timerController.add(const Duration(seconds:5));
              _timerController.start();
              isRunning = true;
            },
            child: const Text(
              '+5',
              style: TextStyle(color: Colors.white),
            ),
          ),

        ],
      ),
    ]);
  }

  void openBottomSheet(BuildContext context, TimerController timerController, TextEditingController controller) {
    showModalBottomSheet(context: context,

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),

        builder: (context) => Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )
          ),
          const SizedBox(height: 20),
          const Text('input time', style: TextStyle(fontSize: 24),),
          const SizedBox(height: 20),
          CustomTextField(controller: controller, label:'input time',keyBoardType: TextInputType.number),
          const SizedBox(height: 20),
          FilledButton(
            style: FilledButton.styleFrom(
                foregroundColor: Colors.white, fixedSize: const Size(150, 50)),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
                timerController.setMyDuration(Duration(seconds: int.parse(controller.text)));
                timerController.reset();
              });
            },
            child: const Text(
              'set time',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )
    ));
  }
}
