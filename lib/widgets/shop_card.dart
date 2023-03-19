import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  ShopCard({
    super.key,
    this.shopName
  });

  var shopName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 5,
        right: 5,
        bottom: 5
      ),
      width: MediaQuery.of(context).size.width * .75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.network('https://d1sag4ddilekf6.azureedge.net/compressed/merchants/1-CYMHUGBVTUKAGN/hero/9460263fa5c945e08e7830c2b1c53367_1642690004885397679.jpg',
                // child: Image.net,
                ),
              ),
              Positioned(
                top: 15,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)
                  ),
                  child: Container(
                    color: Colors.pink,
                    padding: const EdgeInsets.all(5),
                    child: const Text('13% OFF Min 2\$'),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text('$shopName', style: const TextStyle(
              fontWeight: FontWeight.bold),),
          const SizedBox(height: 5),
          Text('\$\$\$ Beverage, Milk Tea'),
          const SizedBox(height: 5),
          Text('\$ delivery fee 0.71', style: TextStyle(
              fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}