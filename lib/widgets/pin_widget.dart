import 'package:flutter/material.dart';
import 'package:uptodo/theme/app_colors.dart';

class PinWidget extends StatelessWidget {

  final TextEditingController pin1C;
  final TextEditingController pin2C;
  final TextEditingController pin3C;
  final TextEditingController pin4C;

  const PinWidget({super.key, required this.pin1C,required this.pin2C,required this.pin3C,required this.pin4C});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 64,
              width: 68,
              child: TextFormField(
                controller: pin1C,
                obscureText: true,
                autofocus: true,
                keyboardType: TextInputType.number,
                onSaved: (pin1) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                maxLength: 1,
                decoration: const InputDecoration(
                    counterText: "", border: OutlineInputBorder()),
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.white),
              ),
            ),
            SizedBox(
              height: 64,
              width: 68,
              child: TextFormField(
                controller: pin2C,

                obscureText: true,
                autofocus: true,
                keyboardType: TextInputType.number,
                onSaved: (pin2) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                maxLength: 1,
                decoration: const InputDecoration(
                    counterText: "", border: OutlineInputBorder()),
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.white),
              ),
            ),
            SizedBox(
              height: 64,
              width: 68,
              child: TextFormField(
                controller: pin3C,

                obscureText: true,

                autofocus: true,
                keyboardType: TextInputType.number,
                onSaved: (pin3) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                maxLength: 1,
                decoration: const InputDecoration(
                    counterText: "", border: OutlineInputBorder()),
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.white),
              ),
            ),
            SizedBox(
              height: 64,
              width: 68,
              child: TextFormField(
                controller: pin4C,

                obscureText: true,
                autofocus: true,
                keyboardType: TextInputType.number,
                onSaved: (pin4) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                maxLength: 1,
                decoration: const InputDecoration(
                    counterText: "", border: OutlineInputBorder()),
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
