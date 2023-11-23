import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 56,
        width: 295,
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFC),
          borderRadius: BorderRadius.circular(5),
          border: const Border.fromBorderSide(
            BorderSide(
              color: Color(0xFFE3E3E6),
            ),
          ),
        ),
        child: Row(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 17,
                ),
                child: Image.asset('assets/google.png'),
              ),
              Container(
                height: 56,
                width: 1,
                color: const Color(0xFFE3E3E6),
              )
            ]),
            Container(
              padding: const EdgeInsets.only(left: 17),
              child: const Text(
                "Continuar com o Google",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
