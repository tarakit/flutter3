import 'package:flutter/material.dart';
import 'package:untitled/data/response/api_response.dart';
import 'package:untitled/models/response/image.dart';
import 'package:untitled/repository/restaurant_repository.dart';

import '../data/response/status.dart';
import '../models/response/restaurant.dart';

class RestaurantViewModel extends ChangeNotifier{

  final _restaurantRepository = RestaurantRepository();

  dynamic restaurants = ApiResponse.loading();
  dynamic image = ApiResponse();

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

  Future<dynamic> postRestaurant(requestBody) async{
    await _restaurantRepository.postRestaurant(requestBody)
        .then((value) => setRestaurantList(ApiResponse.completed(value)))
        .onError((error, stackTrace) => setRestaurantList(ApiResponse.error(error.toString())));
  }

  Future<dynamic> putRestaurant(requestBody, id) async{
    await _restaurantRepository.putRestaurant(requestBody, id)
        .then((value) => setRestaurantList(ApiResponse.completed(value)))
        .onError((error, stackTrace) => setRestaurantList(ApiResponse.error(error.toString())));
  }

  setRestaurantList(response){
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

  Future<dynamic> deleteRestaurant(id) async{
    await _restaurantRepository.deleteRestaurant(id);
  }
}