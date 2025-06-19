import 'package:flutter/material.dart';

class InfosCar extends StatelessWidget {
  final String infos;
  const InfosCar({
    super.key,
    required this.infos,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Center(
            child: Text(
              ". ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: size.width / 3.5,
            child: Text(
              infos,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
