import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({required this.revealDate, super.key});
  final DateTime revealDate;

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  late Duration _timeRemaining;

  @override
  void initState() {
    super.initState();
    _timeRemaining = widget.revealDate.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      setState(() {
        _timeRemaining = widget.revealDate.difference(now);
        if (_timeRemaining.isNegative) {
          _timer.cancel(); // Stop the timer when the countdown ends
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    return 'Unlock in: ${days}d ${hours}h ${minutes}m ${seconds}s';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeRemaining.isNegative ? 'Unlocked!' : _formatDuration(_timeRemaining),
      style: TextStyle(
        color: _timeRemaining.isNegative
            ? const Color.fromARGB(255, 81, 215, 85)
            : Colors.deepOrange,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
