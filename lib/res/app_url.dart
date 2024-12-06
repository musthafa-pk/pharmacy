class AppUrl{
  static const port = '3000';

  static const hostedip = '13.232.117.141';

  // static const localip = '192.168.1.10';

  static var baseUrl = 'http://${hostedip}:${port}/chemist';

  static var login = '$baseUrl/chemist_login';

  static var profile = '$baseUrl/chemist_profile';

  static var getorders = '$baseUrl/getorder';

  static var respond = '$baseUrl/orderResponse';

  static var confirmedOrders = '$baseUrl/getconfirmedorder';
}