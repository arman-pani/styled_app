import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StylingLoadingAnimation extends StatelessWidget {
  final String selectedStyleImageUrl;
  const StylingLoadingAnimation(
      {super.key, required this.selectedStyleImageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 55,
          height: 55,
          child: DecoratedBox(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(selectedStyleImageUrl),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                border: const Border.fromBorderSide(
                  BorderSide(
                      color: Colors.white,
                      width: 3,
                      strokeAlign: BorderSide.strokeAlignOutside),
                )),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 7, left: 10),
          child: Text(
            "Styling",
            style: TextStyle(
              letterSpacing: 2,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: SpinKitThreeBounce(
            size: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
