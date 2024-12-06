class Address {
  final String address;

  Address({required this.address});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(address: json['address']);
  }
}