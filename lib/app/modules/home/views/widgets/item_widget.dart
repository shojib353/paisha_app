import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String? amount;
  final Color? textColor;

  const ItemWidget({super.key, required this.icon, required this.title, this.amount, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(6.0),
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Image.asset(
            icon,
            height: 40,
            width: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(fontSize: 10,color: textColor),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          amount ?? "",
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600,color: textColor),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}