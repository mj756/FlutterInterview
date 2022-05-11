class ModelCategory {
  late List<Categories> categories;
  late String bannerImage;
  late String status;
  late String message;

  ModelCategory({required this.categories, required this.bannerImage, required this.status, required this.message});

  ModelCategory.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories =  List.empty(growable: true);
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
    bannerImage = json['banner_image'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories'] = categories.map((v) => v.toJson()).toList();
    data['banner_image'] = bannerImage;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Categories {
  late String categoryId;
  late String categoryName;
  late String parentId;
  late List<Child> child;

  Categories({required this.categoryId, required this.categoryName, required this.parentId, required this.child});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    parentId = json['parent_id'];
    if (json['child'] != null) {
      child =  List.empty(growable: true);
      json['child'].forEach((v) {
        child.add(Child.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['parent_id'] = parentId;
    data['child'] = child.map((v) => v.toJson()).toList();
    return data;
  }
}

class Child {
  late String categoryId;
  late String categoryName;
 late String parentId;

  Child({required this.categoryId, required this.categoryName, required this.parentId});

  Child.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['parent_id'] = parentId;
    return data;
  }
}
