import 'package:untitled/data/network/Network_api_service.dart';
import 'package:untitled/models/request/restaurant_request.dart';
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

  Future<dynamic> postRestaurant(requestBody) async{
    try{
        var restaurantBody = RestaurantRequest(data: requestBody);
        dynamic response = await _apiService.postApi(AppUrl.postRestaurant,
                                                        restaurantBody.toJson());
        return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> putRestaurant(requestBody, id) async{
    try{
      var restaurantBody = RestaurantRequest(data: requestBody);
      var url = '${AppUrl.postRestaurant}/$id';
      dynamic response = await _apiService.putApi(url, restaurantBody.toJson());
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> deleteRestaurant(id) async{
    try{
      var url = '${AppUrl.postRestaurant}/$id';

      dynamic response = await _apiService.deleteApi(url);
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