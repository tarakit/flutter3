import 'package:flutter/material.dart';
import 'package:untitled/models/response/restaurant.dart';
import 'package:untitled/views/add_restaurant/add_restaurants.dart';

class ShopCard extends StatelessWidget {
  ShopCard({
    super.key,
    required this.data
  });

  RestaurantData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRestaurant(data: data, isUpdate: true)));
      },
      child: Container(
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
                  child: SizedBox(
                    height: 190,
                    child: Image.network(
                      'https://cms.istad.co${data.attributes.picture.data.attributes.url}',
                    // child: Image.net,
                    ),
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
                      child: Text('${data.attributes.discount}% OFF Min 2\$'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(data.attributes.name, style: const TextStyle(
                fontWeight: FontWeight.bold),),
            const SizedBox(height: 5),
            Text('\$\$\$ ${data.attributes.category}'),
            const SizedBox(height: 5),
            Text('\$ delivery fee ${data.attributes.deliveryFee}', style: const TextStyle(
                fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}