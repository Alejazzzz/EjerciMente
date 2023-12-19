import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTimerButton extends StatefulWidget {
  final int seconds;

  const MyTimerButton({required this.seconds});

  @override
  _MyTimerButtonState createState() => _MyTimerButtonState();
}

class _MyTimerButtonState extends State<MyTimerButton> with SingleTickerProviderStateMixin {
  static const TextStyle infoStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  late AnimationController _controller;
  late Animation<int> _animation;

  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.seconds),
    );

    _animation = IntTween(begin: widget.seconds, end: 0).animate(_controller)
      ..addListener(() {
        setState(() {
          // Rebuild the widget to reflect the updated time.
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _isTimerRunning = false;
        }
      });
  }

  void _startStopTimer() {
    if (_isTimerRunning) {
      _controller.stop();
    } else {
      _controller.reverse(from: _controller.value == 0.0 ? 1.0 : _controller.value);
    }
    _isTimerRunning = !_isTimerRunning;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _startStopTimer();
      },
      child: Text(
        _isTimerRunning
            ? _animation.value == 20
            ? 'Tiempo: ${_animation.value} s (Reiniciar)'
            : 'Tiempo: ${_animation.value} s (Detener)'
            : 'Iniciar cronómetro',
        style: infoStyle,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
