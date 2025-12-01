// import 'package:flutter/material.dart';

// class AppButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   const AppButton({super.key, required this.text, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
//       ),
//       onPressed: onPressed,
//       child: Text(text, style: const TextStyle(fontSize: 18)),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 18)),
    );
  }
}
