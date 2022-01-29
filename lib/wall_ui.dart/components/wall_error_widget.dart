import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WallErrorWidget extends StatelessWidget {
  final double screenHeight;
  final String errorMessage;
  const WallErrorWidget({
    Key? key,
    required this.screenHeight,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 64),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          // const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: screenHeight * 0.6),
                child: SvgPicture.asset('assets/images/illustration_error.svg')),
          ),
        ],
      ),
    );
  }
}
