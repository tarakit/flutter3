class AppUrl {
  static var baseUrl = 'https://cms.istad.co/api';
  static var allRestaurants = '$baseUrl/food-panda-restaurants?populate=*';
  static var allShops = '$baseUrl/food-panda-shops';
  static var allCuisines = '$baseUrl/food-panda-cuisines?populate=*';
  static var uploadImage = '$baseUrl/upload';
}