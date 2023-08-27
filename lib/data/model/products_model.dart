class ProductsModel {
  String? productId;
  String? productName;
  String? productNameAr;
  String? productDesc;
  String? productDescAr;
  String? price;
  String? priceWithDiscount;
  String? productImage;
  String? createdAt;
  String? productActive;
  String? productDiscount;
  String? availableQuantity;
  String? categoryId;
  String? categoryName;
  String? favorite;

  ProductsModel(
      {this.productId,
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
      this.priceWithDiscount,
      this.categoryId,
      this.categoryName,
      this.favorite
      });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    productDesc = json['product_desc'];
    productDescAr = json['product_desc_ar'];
    price = json['price'];
    priceWithDiscount = json['price_with_discount'];
    productImage = json['product_image'];
    createdAt = json['created_at'];
    productActive = json['product_active'];
    productDiscount = json['product_discount'];
    availableQuantity = json['available_quantity'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_name_ar'] = productNameAr;
    data['product_desc'] = productDesc;
    data['product_desc_ar'] = productDescAr;
    data['price'] = price;
    data['price_with_discount'] = priceWithDiscount;
    data['product_image'] = productImage;
    data['created_at'] = createdAt;
    data['product_active'] = productActive;
    data['product_discount'] = productDiscount;
    data['available_quantity'] = availableQuantity;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['favorite'] = favorite;
    return data;
  }
}