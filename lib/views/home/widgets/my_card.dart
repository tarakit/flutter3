import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .75,
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  'https://d1sag4ddilekf6.azureedge.net/compressed/merchants/1-CYMHUGBVTUKAGN/hero/9460263fa5c945e08e7830c2b1c53367_1642690004885397679.jpg',
                ),
                Positioned(
                  top: 15,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    child: Container(
                      color: Colors.pink,
                      padding: const EdgeInsets.all(5),
                      child: const Text('13% OFF Min 2\$'),
                    ),
                  ),
                )
              ],
            ),
            Text('KOI The IFL'),
          ],
        ));
  }
}
