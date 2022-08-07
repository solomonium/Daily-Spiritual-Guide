import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spiritual_daily_guide/widgets/app_text.dart';

import '../widgets/app_large_text.dart';
import '../widgets/shimmer_widget.dart';

class Bible extends StatefulWidget {
  const Bible({Key? key}) : super(key: key);

  @override
  State<Bible> createState() => _BibleState();
}

class _BibleState extends State<Bible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: AppLargeText(text: 'Shimmer Effect')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return buildFoodShimmer();
                  })
            ],
          ),
        ),
      ),
    );
  }

// This Shimmer effect is loaded from the future method using a boolean value to set the state
  Widget buildFoodShimmer() {
    return ListTile(
      leading: ShimmerWidget.cirular(
        height: 64,
        width: 64,
        shapeBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: ShimmerWidget.rectangular(
          height: 16,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
      subtitle: const ShimmerWidget.rectangular(height: 14),
    );
  }
}
