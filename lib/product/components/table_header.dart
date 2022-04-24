import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  final String name;
  final bool? isSort;
  final IconData? icon;
  final Function()? ontap;
  const TableHeader({
    Key? key,
    required this.name,
    this.isSort,
    this.icon,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          onTap: ontap,
          child: Row(
            children: [
              Text(name),
              if (isSort == true)
                Icon(
                  icon,
                  color: Colors.white,
                )
            ],
          )),
    );
  }
}
