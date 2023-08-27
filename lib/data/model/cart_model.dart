class CartModel {
  String? cartId;
  String? quantity;
  String? userId;
  String? totalPrice;
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

  CartModel(
      {this.cartId,
      this.quantity,
      this.userId,
      this.totalPrice,
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

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    quantity = json['quantity'];
    userId = json['user_id'];
    totalPrice = json['total_price'];
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
    data['cart_id'] = cartId;
    data['quantity'] = quantity;
    data['user_id'] = userId;
    data['total_price'] = totalPrice;
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