import 'package:flutter/material.dart';

import '../base/utils.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(red),
      ),
    );
  }
}
