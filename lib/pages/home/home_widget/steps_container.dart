import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/core/widgets/custom_text_field.dart';
import 'package:fitgenie/permission/ask_permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/provider/app_provider.dart';

class StepsContainerView extends StatefulWidget {
  final AppProvider provider;

  const StepsContainerView({Key? key, required this.provider})
      : super(key: key);

  @override
  _StepsContainerViewState createState() => _StepsContainerViewState();
}

class _StepsContainerViewState extends State<StepsContainerView> {
  int? _steps;
  int _stepsGoal = 10000;
  bool isRunning = false;
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSavedData();
    _initPedometer();
    widget.provider.updateSteps();
  }

  Future<void> _saveData(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final provider = widget.provider;
    setState(() {
      _steps = provider.steps;
      _stepsGoal = prefs.getInt('stepsGoal') ?? 1000;
    });
  }

  void _initPedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _stepCountStream.listen(_onStepCount).onError(_onStepCountError);
    _pedestrianStatusStream
        .listen(_onPedestrianStatusChanged)
        .onError(_onPedestrianStatusError);
  }

  void _onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps;
    });
    DateTime timeStamp = event.timeStamp;
    _saveData('timestamp', timeStamp.millisecondsSinceEpoch);
    _saveData('steps', event.steps);
  }

  void _onStepCountError(error) {
    checkPermissionStatus();
    print('Step Count Error: $error');
  }

  void _onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      isRunning = !isRunning;
    });
    print('Pedestrian Status: $isRunning');
    print(event.status);
  }

  void _onPedestrianStatusError(error) {
    checkPermissionStatus();
    print('Pedestrian Status Error: $error');
  }
  @override
  Widget build(BuildContext context) {
    double linearPercent = (_steps ?? 0) / _stepsGoal;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: (width * 0.5) - 30,
      height: height * 0.18,
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Steps',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: showModalBottomSheets,
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg/running_shoe.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$_steps',
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Column(
                children: [
                  Icon(
                    isRunning ? Icons.directions_run : Icons.accessibility,
                    color: Colors.white,
                    size: 14,
                  ),
                  Text(
                    isRunning ? 'Running' : 'stopped',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(
                'Goal: $_stepsGoal',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const Spacer(),
              Text(
                '${(linearPercent * 100).toStringAsFixed(2)} %',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              )
            ],
          ),
          LinearProgressIndicator(
            value: linearPercent,
            backgroundColor: Colors.white,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffFFC107)),
            minHeight: 4,
            borderRadius: BorderRadius.circular(20),
          ),
        ],
      ),
    );
  }

  Future<void> showModalBottomSheets() async {
    TextEditingController stepsController = TextEditingController();
    TextEditingController goalController = TextEditingController();
    stepsController.text = _steps.toString();
    goalController.text = _stepsGoal.toString();

    return showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.65,
          child: ListView(
            children: [
              Row(
                children: [
                  const Text(
                    'Set Steps Goal',
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                      ))
                ],
              ),
              CustomTextField(
                controller: stepsController,
                keyboardType: TextInputType.number,
                label: 'Steps',
              ),
              CustomTextField(
                controller: goalController,
                keyboardType: TextInputType.number,
                label: 'Steps Goal',
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 400),
                delay: const Duration(milliseconds: 200),
                child: LongButton(
                    label: 'save',
                    onTap: () {
                      setState(() {
                        _stepsGoal = int.parse(goalController.text.isEmpty
                            ? '10000'
                            : goalController.text);
                        _steps = int.parse(stepsController.text.isEmpty
                            ? '0'
                            : stepsController.text);
                        _saveData('stepsGoal', _stepsGoal);
                        _saveData('steps', _steps ?? 0);
                        Navigator.pop(context);
                      });
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
