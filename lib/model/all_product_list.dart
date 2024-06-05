class AllProductListModel {
  List<Products>? products;

  AllProductListModel({this.products});

  AllProductListModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? productId;
  int? categoryId;
  int? subCategoryId;
  int? childCategoryId;
  String? nameEn;
  String? image;
  int? rating;
  dynamic regPrice;
  int? disType;
  dynamic disPrice;
  String? brand;
  String? stock;

  Products(
      {this.productId,
      this.categoryId,
      this.subCategoryId,
      this.childCategoryId,
      this.nameEn,
      this.image,
      this.rating,
      this.regPrice,
      this.disType,
      this.disPrice,
      this.brand,
      this.stock});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    childCategoryId = json['child_category_id'];
    nameEn = json['name_en'];
    image = json['image'];
    rating = json['rating'];
    regPrice = json['reg_price'];
    disType = json['dis_type'];
    disPrice = json['dis_price'];
    brand = json['brand'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['child_category_id'] = childCategoryId;
    data['name_en'] = nameEn;
    data['image'] = image;
    data['rating'] = rating;
    data['reg_price'] = regPrice;
    data['dis_type'] = disType;
    data['dis_price'] = disPrice;
    data['brand'] = brand;
    data['stock'] = stock;
    return data;
  }
}
