import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/helper_widgets/provide_lorem_ipsum.dart';

class DocumentationColumn extends StatelessWidget {
  const DocumentationColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Text("How to use this App",
            style: Theme.of(context).textTheme.headlineMedium),
        const Spacer(),
        const ProvideLoremIpsum(),
        const Spacer(),
        Text("Different Signal Modes",
            style: Theme.of(context).textTheme.headlineMedium),
        const Spacer(),
        const ProvideLoremIpsum(),
        const Spacer(),
      ],
    );
  }
}
