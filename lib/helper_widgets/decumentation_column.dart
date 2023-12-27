import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/helper_widgets/provide_lorem_ipsum.dart';

class DocumentationColumn extends StatelessWidget {
  const DocumentationColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        Text("How to use this App", style: TextStyle(fontSize: 25)),
        Spacer(),
        ProvideLoremIpsum(),
        Spacer(),
        Text(
          "Different Signal Modes",
          style: TextStyle(fontSize: 25),
        ),
        Spacer(),
        ProvideLoremIpsum(),
        Spacer(),
      ],
    );
  }
}
