import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mix/mix.dart';
import '../theme/styles/action_button.dart';


class Workspace extends StatelessWidget {
  const Workspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColumnBox(
        style: FlexBoxStyler()
            .paddingX(20.0)
            .spacing(10.0)
            .mainAxisAlignment(.center)
            .width(double.infinity),
        children: [
          ActionButton(
            onPressed: () {},
            label: "Yes, Logout",
            type: ButtonType.filled,
            icon: LucideIcons.shoppingBag,
            alignment: .start,
          ),
        ],
      ),
    );
  }
}
