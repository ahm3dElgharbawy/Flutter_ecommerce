class OrdersModel {
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

  OrdersModel(
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
      });

  OrdersModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
