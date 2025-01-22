import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String? label;
  final String? value;
  final Color colors;

  const Labels({
    Key? key,
    required this.label,
    required this.value,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colors,
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        children: [
          label!.isNotEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 6.0, right: 6.0, top: 4.0),
                  child: Text(
                    label ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              : SizedBox(),
          Padding(
            padding: EdgeInsets.only(
                left: 6.0,
                right: 6.0,
                bottom: 4.0,
                top: label!.isNotEmpty ? 0 : 4.0),
            child: Text(
              value ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
