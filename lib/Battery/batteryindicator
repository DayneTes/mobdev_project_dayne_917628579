import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryIndicator extends StatefulWidget {
  const BatteryIndicator({super.key});

  @override
  _BatteryIndicatorState createState() => _BatteryIndicatorState();
}

class _BatteryIndicatorState extends State<BatteryIndicator> {
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  BatteryState _batteryState = BatteryState.full;

  @override
  void initState() {
    super.initState();
    _getBatteryInfo();
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _batteryState = state;
      });
    });
  }

  Future<void> _getBatteryInfo() async {
    final int batteryLevel = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          _batteryState == BatteryState.charging
              ? Icons.battery_charging_full
              : Icons.battery_full,
          color: _batteryLevel <= 20 ? Colors.red : Colors.green,
        ),
        SizedBox(width: 5),
        Text(
          '$_batteryLevel%',
          style: TextStyle(
            fontSize: 18,
            color: _batteryLevel <= 20 ? Colors.red : Colors.black,
          ),
        ),
      ],
    );
  }
}