import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.details, {Key? key}) : super(key: key);
  final FlutterErrorDetails details;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/error.json'),
            const SizedBox(height: 12),
            Text(
              details.exception.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              details.stack.toString(),
              maxLines: 8,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
