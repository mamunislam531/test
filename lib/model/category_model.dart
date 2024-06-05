class CategoriesModel {
  List<Categories>? categories;

  CategoriesModel({this.categories});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? categoryId;
  CategoryName? categoryName;
  String? categoryImage;
  List<SubCategoriesList>? subCategoriesList;

  Categories(
      {this.categoryId,
        this.categoryName,
        this.categoryImage,
        this.subCategoriesList});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'] != null
        ? CategoryName.fromJson(json['category_name'])
        : null;
    categoryImage = json['category_image'];
    if (json['sub_categories_list'] != null) {
      subCategoriesList = <SubCategoriesList>[];
      json['sub_categories_list'].forEach((v) {
        subCategoriesList!.add(SubCategoriesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    if (categoryName != null) {
      data['category_name'] = categoryName!.toJson();
    }
    data['category_image'] = categoryImage;
    if (subCategoriesList != null) {
      data['sub_categories_list'] =
          subCategoriesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryName {
  String? en;

  CategoryName({this.en});

  CategoryName.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    return data;
  }
}

class SubCategoriesList {
  int? subCategoryId;
  CategoryName? subCategories;
  List<ChildCategoriesList>? childCategoriesList;

  SubCategoriesList(
      {this.subCategoryId, this.subCategories, this.childCategoriesList});

  SubCategoriesList.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    subCategories = json['sub_categories'] != null
        ? CategoryName.fromJson(json['sub_categories'])
        : null;
    if (json['child_categories_list'] != null) {
      childCategoriesList = <ChildCategoriesList>[];
      json['child_categories_list'].forEach((v) {
        childCategoriesList!.add(ChildCategoriesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_category_id'] = subCategoryId;
    if (subCategories != null) {
      data['sub_categories'] = subCategories!.toJson();
    }
    if (childCategoriesList != null) {
      data['child_categories_list'] =
          childCategoriesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildCategoriesList {
  int? childCategoryId;
  CategoryName? childCategoryName;
  String? image;

  ChildCategoriesList(
      {this.childCategoryId, this.childCategoryName, this.image});

  ChildCategoriesList.fromJson(Map<String, dynamic> json) {
    childCategoryId = json['child_category_id'];
    childCategoryName = json['child_category_name'] != null
        ? CategoryName.fromJson(json['child_category_name'])
        : null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['child_category_id'] = childCategoryId;
    if (childCategoryName != null) {
      data['child_category_name'] = childCategoryName!.toJson();
    }
    data['image'] = image;
    return data;
  }
}
