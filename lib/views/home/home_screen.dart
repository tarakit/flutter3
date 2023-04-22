import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data/response/status.dart';
import 'package:untitled/viewmodels/restaurant_viewmodel.dart';
import 'package:untitled/views/add_restaurant/add_restaurants.dart';

import 'widgets/cuisine_card.dart';
import 'widgets/left_drawer.dart';
import 'widgets/shop_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var restaurantViewModel = RestaurantViewModel();
  
  @override
  void initState() {
    restaurantViewModel.fetchAllRestaurants();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '2 St 562',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'Phnom Penh',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (ctx) => AddRestaurant()));

          }, icon: Icon(Icons.favorite)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_basket)),
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll){
          overScroll.disallowIndicator();
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                expandedHeight: 60,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                stretch: true,
                title: InkWell(
                  onTap: () {},
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: 40,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 23,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search for foods & Restuarants',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )
                        ],
                      )),
                )),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.grey[100],
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          onTap: (){},
                          // splashColor: Colors.pinkAccent.shade100,
                          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Food delivery',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Order food you love'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(
                                  'assets/images/burger.png',
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 15, right: 7.5,bottom: 15),
                            width: 200,
                            height: 175,
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shops',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Groceries, SEA game merchandist and more',
                                  // maxLines: 1,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    'assets/images/chicken.png',
                                    width: 90,
                                    height: 90,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 200,
                            height: 175,
                            margin: EdgeInsets.only(right: 15, left: 7.5, bottom: 15),
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pick-Up',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Up to 50% off'),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    'assets/images/chicken.png',
                                    width: 90,
                                    height: 90,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text('Your Restaurants',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ),
            SliverToBoxAdapter(
                child: ChangeNotifierProvider<RestaurantViewModel>(
                  create: (context) => restaurantViewModel,
                  child: Consumer<RestaurantViewModel>(
                    builder: (create, value, _) {
                      switch(value.restaurants.status){
                        case Status.LOADING: 
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case Status.COMPLETE:
                          return SizedBox(
                            height: 275,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:  value.restaurants.data!.data.length,
                                itemBuilder: (builder, index){
                                  print('index = $index ${value.restaurants.data!.data[index].attributes.picture.data}');
                                  // if(value.restaurants.data!.data[index].attributes.picture.data == null){
                                  //   print('null at $index');
                                  // }else {
                                  //   return ShopCard(
                                  //       data: value.restaurants.data!
                                  //           .data[index]);
                                  // }
                                  return ShopCard(
                                            data: value.restaurants.data!
                                                .data[index]);
                                }
                            ),
                          );
                        default: return const CircularProgressIndicator();
                      }
                    }
                    
                  ),
                )
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: Text('Cuisines',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
                  height: 230,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 38,
                    ),
                    itemBuilder: (builder, index){
                      return CuisineCard();
                    },
                  ),
                )
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: Text('Shops',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
                  height: 95,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,

                    ),
                    itemBuilder: (builder, index){
                      return CuisineCard();
                    },
                  ),
                )
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1,
                        color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(15))
                ),
                child: Card(
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Become a pro', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            Text('and get exclusive deals')
                          ]
                      ),
                      SizedBox(
                          height: 70,
                          child: Image.asset('assets/images/burger.png'))
                    ],
                  ),
                ),
              ),
            )
            // SliverList(
            //
            //     delegate: SliverChildBuilderDelegate(
            //       childCount: 15,
            //           (context, index) =>
            //               Container(
            //                 width: MediaQuery.of(context).size.width * .75,
            //                 child: Column(
            //                   children: [
            //                     Stack(
            //                       children: [
            //                         Image.network('https://d1sag4ddilekf6.azureedge.net/compressed/merchants/1-CYMHUGBVTUKAGN/hero/9460263fa5c945e08e7830c2b1c53367_1642690004885397679.jpg',
            //                         ),
            //                         Positioned(
            //                           top: 15,
            //                           child: ClipRRect(
            //                             borderRadius: const BorderRadius.only(
            //                                 topRight: Radius.circular(8),
            //                                 bottomRight: Radius.circular(8)
            //                             ),
            //                             child: Container(
            //                               color: Colors.pink,
            //                               padding: const EdgeInsets.all(5),
            //                               child: const Text('13% OFF Min 2\$'),
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                     Text('KOI The IFL'),
            //                   ],
            //                 ),
            //               ),
            // ),
            // ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     height: 200.0,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 10,
            //       itemBuilder: (context, index) {
            //         return const MyCard();
            //       },
            //     ),
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     height: 200.0,
            //     child: GridView.builder(
            //       itemCount: 16,
            //       scrollDirection: Axis.horizontal,
            //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //           crossAxisSpacing: 10,
            //           mainAxisSpacing: 10,
            //         ),
            //         itemBuilder: (context, index){
            //           return const MyCard();
            //         })
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     height: 200.0,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 10,
            //       itemBuilder: (context, index) {
            //         return Container(
            //             width: MediaQuery.of(context).size.width * .75,
            //             child: Column(
            //               children: [
            //                 Stack(
            //                   children: [
            //                     Image.network(
            //                       'https://d1sag4ddilekf6.azureedge.net/compressed/merchants/1-CYMHUGBVTUKAGN/hero/9460263fa5c945e08e7830c2b1c53367_1642690004885397679.jpg',
            //                     ),
            //                     Positioned(
            //                       top: 15,
            //                       child: ClipRRect(
            //                         borderRadius: const BorderRadius.only(
            //                             topRight: Radius.circular(8),
            //                             bottomRight: Radius.circular(8)),
            //                         child: Container(
            //                           color: Colors.pink,
            //                           padding: const EdgeInsets.all(5),
            //                           child: const Text('13% OFF Min 2\$'),
            //                         ),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 Text('KOI The IFL'),
            //               ],
            //             ));
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
      drawer: LeftDrawer(),

    );
  }
}