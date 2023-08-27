class OrderDetailsModel {
  String? orderId;
  String? userId;
  String? addressId;
  String? paymentType;
  String? orderType;
  String? orderPrice;
  String? orderStatus;
  String? finalPrice;
  String? deliveryPrice;
  String? couponId;
  String? rating;
  String? comment;
  String? orderDatetime;
  String? cartId;
  String? quantity;
  String? city;
  String? street;
  String? latitude;
  String? longitude;
  String? productId;
  String? productName;
  String? productNameAr;
  String? productDesc;
  String? productDescAr;
  String? price;
  String? productImage;
  String? createdAt;
  String? productActive;
  String? productDiscount;
  String? availableQuantity;
  String? categoryId;

  OrderDetailsModel(
      {this.orderId,
      this.userId,
      this.addressId,
      this.paymentType,
      this.orderType,
      this.orderPrice,
      this.orderStatus,
      this.finalPrice,
      this.deliveryPrice,
      this.couponId,
      this.rating,
      this.comment,
      this.orderDatetime,
      this.cartId,
      this.quantity,
      this.city,
      this.street,
      this.latitude,
      this.longitude,
      this.productId,
      this.productName,
      this.productNameAr,
      this.productDesc,
      this.productDescAr,
      this.price,
      this.productImage,
      this.createdAt,
      this.productActive,
      this.productDiscount,
      this.availableQuantity,
      this.categoryId});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentType = json['payment_type'];
    orderType = json['order_type'];
    orderPrice = json['order_price'];
    orderStatus = json['order_status'];
    finalPrice = json['final_price'];
    deliveryPrice = json['delivery_price'];
    couponId = json['coupon_id'];
    rating = json['rating'];
    comment = json['comment'];
    orderDatetime = json['order_datetime'];
    cartId = json['cart_id'];
    quantity = json['quantity'];
    city = json['city'];
    street = json['street'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    productId = json['product_id'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    productDesc = json['product_desc'];
    productDescAr = json['product_desc_ar'];
    price = json['price'];
    productImage = json['product_image'];
    createdAt = json['created_at'];
    productActive = json['product_active'];
    productDiscount = json['product_discount'];
    availableQuantity = json['available_quantity'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['user_id'] = userId;
    data['address_id'] = addressId;
    data['payment_type'] = paymentType;
    data['order_type'] = orderType;
    data['order_price'] = orderPrice;
    data['order_status'] = orderStatus;
    data['final_price'] = finalPrice;
    data['delivery_price'] = deliveryPrice;
    data['coupon_id'] = couponId;
    data['rating'] = rating;
    data['comment'] = comment;
    data['order_datetime'] = orderDatetime;
    data['cart_id'] = cartId;
    data['quantity'] = quantity;
    data['city'] = city;
    data['street'] = street;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_name_ar'] = productNameAr;
    data['product_desc'] = productDesc;
    data['product_desc_ar'] = productDescAr;
    data['price'] = price;
    data['product_image'] = productImage;
    data['created_at'] = createdAt;
    data['product_active'] = productActive;
    data['product_discount'] = productDiscount;
    data['available_quantity'] = availableQuantity;
    data['category_id'] = categoryId;
    return data;
  }
}
