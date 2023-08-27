class AddressModel {
  String? addressId;
  String? addressName;
  String? userId;
  String? city;
  String? street;
  String? latitude;
  String? longitude;

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    userId = json['user_id'];
    city = json['city'];
    street = json['street'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  
  AddressModel(
      {this.addressId,
      this.addressName,
      this.userId,
      this.city,
      this.street,
      this.latitude,
      this.longitude});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['address_name'] = addressName;
    data['user_id'] = userId;
    data['city'] = city;
    data['street'] = street;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}