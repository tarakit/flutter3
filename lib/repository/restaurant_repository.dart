import 'package:untitled/data/network/Network_api_service.dart';
import 'package:untitled/models/response/image.dart';
import 'package:untitled/res/app_url.dart';

import '../models/response/restaurant.dart';

class RestaurantRepository{

  final NetworkApiService _apiService = NetworkApiService();

  Future<Restaurant> getRestaurants() async {
    try{
      dynamic response = await _apiService.getApiResponse(AppUrl.allRestaurants);
      return response = Restaurant.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  Future<ImageModel> uploadImage(file) async{
    try{
        dynamic response = await _apiService.uploadImage(AppUrl.uploadImage, file);
        return response;
    }catch(e){
      rethrow;
    }
  }

  // Future<Shop> getShop() async {
  //   try {
  //     dynamic response = await _apiService.getApiResponse(
  //         AppUrl.allShops);
  //     return response = Shop.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}