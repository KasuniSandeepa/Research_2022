class wholeSalerModel {
  int? wholesellerIdX;
  int? tasteQuality;
  int? price;
  int? ratings;
  int? quantity;
  int? clusterX;
  int? wholesellerIdY;
  int? clusterY;
  int? wholesellerId;
  int? cluster;

  wholeSalerModel(
      {this.wholesellerIdX,
        this.tasteQuality,
        this.price,
        this.ratings,
        this.quantity,
        this.clusterX,
        this.wholesellerIdY,
        this.clusterY,
        this.wholesellerId,
        this.cluster});

  wholeSalerModel.fromJson(Map<String, dynamic> json) {
    wholesellerIdX = json['WholesellerId_x'];
    tasteQuality = json['TasteQuality'];
    price = json['price'];
    ratings = json['Ratings'];
    quantity = json['Quantity'];
    clusterX = json['cluster_x'];
    wholesellerIdY = json['WholesellerId_y'];
    clusterY = json['cluster_y'];
    wholesellerId = json['WholesellerId'];
    cluster = json['cluster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['WholesellerId_x'] = this.wholesellerIdX;
    data['TasteQuality'] = this.tasteQuality;
    data['price'] = this.price;
    data['Ratings'] = this.ratings;
    data['Quantity'] = this.quantity;
    data['cluster_x'] = this.clusterX;
    data['WholesellerId_y'] = this.wholesellerIdY;
    data['cluster_y'] = this.clusterY;
    data['WholesellerId'] = this.wholesellerId;
    data['cluster'] = this.cluster;
    return data;
  }
}