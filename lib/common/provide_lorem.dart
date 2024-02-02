import 'package:flutter/material.dart';

class ProvideLoremIpsum extends StatelessWidget {
  const ProvideLoremIpsum({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nullam eget feliseget odio tincidunt gravida. Fusce euismodnisl ut dui vulputate, in malesuadajusto luctus. Quisque rhoncusvelit ut interdum dictum, elit augue auctor urna,a consequat dui nequenon lectus. Curabitur nec quam nec justo hendrerit faucibus.",
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
