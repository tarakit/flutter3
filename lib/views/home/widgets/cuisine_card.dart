import 'package:flutter/material.dart';

class CuisineCard extends StatelessWidget {
  const CuisineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                    Radius.circular(15)
                ),
                color: Colors.grey[300],
              ),
              padding: EdgeInsets.all(18),
              child: Image.asset('assets/images/burger.png')),
          Text('Burgers', style: TextStyle(fontSize: 12),)
        ]
    );
  }
}

