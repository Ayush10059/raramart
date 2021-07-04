class Category {
  int? categoryId;
  String? categoryName;
  int? parent;
  String? categoryDesc;
  int? count;
  CatImage? image;

  Category({
    this.categoryId,
    this.categoryName,
    this.parent,
    this.categoryDesc,
    this.count,
    this.image,
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json["id"];
    categoryName = json["name"];
    parent = json["parent"];
    categoryDesc = json["description"];
    count = json["count"];
    image =
        (json['image'] != null) ? new CatImage.fromJson(json["image"]) : null;
  }
}

class CatImage {
  String? src;

  CatImage({
    this.src,
  });

  CatImage.fromJson(Map<String, dynamic> json) {
    src = json["src"];
  }
}
