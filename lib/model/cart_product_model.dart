class ViewCartProductListModel {
  List<ProductCart>? productCart;

  ViewCartProductListModel({this.productCart});

  ViewCartProductListModel.fromJson(Map<String, dynamic> json) {
    if (json['product_cart'] != null) {
      productCart = <ProductCart>[];
      json['product_cart'].forEach((v) {
        productCart!.add(ProductCart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productCart != null) {
      data['product_cart'] = productCart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductCart {
  int? productId;
  String? productImage;
  ProductName? productName;
  int? discountType;
  dynamic discountPrice;
  dynamic salePrice;
  int? quantity;

  ProductCart({this.productId, this.productImage, this.productName, this.discountType, this.discountPrice, this.salePrice, this.quantity});

  ProductCart.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productImage = json['product_image'];
    productName = json['product_name'] != null ? ProductName.fromJson(json['product_name']) : null;
    discountType = json['discount_type'];
    discountPrice = json['discount_price'];
    salePrice = json['sale_price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_image'] = productImage;
    if (productName != null) {
      data['product_name'] = productName!.toJson();
    }
    data['discount_type'] = discountType;
    data['discount_price'] = discountPrice;
    data['sale_price'] = salePrice;
    data['quantity'] = quantity;
    return data;
  }
}

class ProductName {
  String? en;

  ProductName({this.en});

  ProductName.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    return data;
  }
}
