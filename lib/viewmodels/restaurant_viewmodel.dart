import 'package:flutter/material.dart';
import 'package:untitled/data/response/api_response.dart';
import 'package:untitled/models/response/image.dart';
import 'package:untitled/repository/restaurant_repository.dart';

import '../data/response/status.dart';
import '../models/response/restaurant.dart';

class RestaurantViewModel extends ChangeNotifier{

  final _restaurantRepository = RestaurantRepository();

  ApiResponse<Restaurant> restaurants = ApiResponse.loading();
  ApiResponse<ImageModel> image = ApiResponse();

  setImageResponse(response){
    if(response.data == null) {
      image.status = Status.LOADING;
    } else{
      image = response;
    }
    notifyListeners();
  }

  Future<dynamic> uploadImage(file) async {
    setImageResponse(ApiResponse.loading());
    await _restaurantRepository.uploadImage(file)
        .then((image) => setImageResponse(ApiResponse.completed(image)))
        .onError((error, stackTrace) => setImageResponse(ApiResponse.error(error.toString())));
  }

  setRestaurantList(response){
    print(response.toString());
    restaurants = response;
    notifyListeners();
  }

  Future<dynamic> fetchAllRestaurants() async{
    await _restaurantRepository.getRestaurants()
        .then((res) {
          setRestaurantList(ApiResponse.completed(res));
        }
        )
        .onError((error, stackTrace) {
          setRestaurantList(ApiResponse.error(error.toString()));
        });
  }
}