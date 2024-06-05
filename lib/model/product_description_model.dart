

class ProductDescriptionModel {
  ProductDetails? productDetails;

  ProductDescriptionModel({this.productDetails});

  ProductDescriptionModel.fromJson(Map<String, dynamic> json) {
    productDetails = json['product_details'] != null
        ? ProductDetails.fromJson(json['product_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productDetails != null) {
      data['product_details'] = productDetails!.toJson();
    }
    return data;
  }
}

class ProductDetails {
  int? rating;
  int? review;
  List<String>? images;
  Description? description;

  ProductDetails({this.rating, this.review, this.images, this.description});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    review = json['review'];
    images = json['images'].cast<String>();
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['review'] = review;
    data['images'] = images;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    return data;
  }
}

class Description {
  String? en;

  Description({this.en});

  Description.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    return data;
  }
}
