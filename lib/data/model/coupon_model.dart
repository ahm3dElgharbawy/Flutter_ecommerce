class CouponModel {
  String? couponId;
  String? couponName;
  String? couponDiscount;
  String? couponCode;
  String? count;
  String? expireDate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponDiscount,
      this.couponCode,
      this.count,
      this.expireDate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponDiscount = json['coupon_discount'];
    couponCode = json['coupon_code'];
    count = json['count'];
    expireDate = json['expire_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_discount'] = couponDiscount;
    data['coupon_code'] = couponCode;
    data['count'] = count;
    data['expire_date'] = expireDate;
    return data;
  }
}
