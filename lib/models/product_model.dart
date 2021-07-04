class Product {
  int? id;
  String? name;
  String? permalink;
  String? description;
  String? shortDescription;
  String? price;
  String? regularPrice;
  String? salePrice;
  List<Images>? images;
  List<Categories>? category;
  List<int>? relatedIds;

  Product({
    this.id,
    this.name,
    this.permalink,
    this.description,
    this.shortDescription,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.images,
    this.category,
    this.relatedIds,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = (json['id'] != "") ? json['id'] : 0;
    name = (json['name'] != "") ? json['name'] : 'Not Available';

    permalink = (json['permalink'] != "") ? json['permalink'] : 'Not Available';

    description = json['description'];
    shortDescription = json['short_description'];

    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice =
        (json['sale_price'] != "") ? json['sale_price'] : json['regular_price'];

    relatedIds = json["related_ids"].cast<int>();

    if (json['categories'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(new Images.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      category = [];
      json['images'].forEach((v) {
        category?.add(new Categories.fromJson(v));
      });
    }
  }

  int calculateDiscount() {
    if (price == '' || this.regularPrice == '' || this.salePrice == '') {
      return 0;
    } else {
      double regularPrice = double.parse(this.regularPrice ?? '');
      double salePrice = double.parse(this.salePrice ?? '');
      double discount = regularPrice - salePrice;
      double disPercent = (discount / regularPrice) * 100;

      return disPercent.round();
    }
  }
}

class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Images {
  String? src;

  Images({this.src});

  Images.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }
}
