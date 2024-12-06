import 'AddressModel.dart';

class Pharmacy {
  final int id;
  final String name;
  final String phoneNo;
  final String lisenceNo;
  final String datetime;
  final String email;
  final String password;
  final int pincode;
  final int createdBy;
  final List<Address> address;

  Pharmacy({
    required this.id,
    required this.name,
    required this.phoneNo,
    required this.lisenceNo,
    required this.datetime,
    required this.email,
    required this.password,
    required this.pincode,
    required this.createdBy,
    required this.address,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      id: json['id'],
      name: json['name'],
      phoneNo: json['phone_no'],
      lisenceNo: json['lisence_no'],
      datetime: json['datetime'],
      email: json['email'],
      password: json['password'],
      pincode: json['pincode'],
      createdBy: json['created_by'],
      address: (json['address'] as List)
          .map((addr) => Address.fromJson(addr))
          .toList(),
    );
  }
}
