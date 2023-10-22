class farmerModel {
  int? farmerIdX;
  int? tasteQuality;
  int? price;
  int? ratings;
  int? quantity;
  int? clusterX;
  int? farmerIdY;
  int? clusterY;
  int? farmerId;
  int? cluster;

  farmerModel(
      {this.farmerIdX,
        this.tasteQuality,
        this.price,
        this.ratings,
        this.quantity,
        this.clusterX,
        this.farmerIdY,
        this.clusterY,
        this.farmerId,
        this.cluster});

  farmerModel.fromJson(Map<String, dynamic> json) {
    farmerIdX = json['FarmerId_x'];
    tasteQuality = json['TasteQuality'];
    price = json['price'];
    ratings = json['Ratings'];
    quantity = json['Quantity'];
    clusterX = json['cluster_x'];
    farmerIdY = json['FarmerId_y'];
    clusterY = json['cluster_y'];
    farmerId = json['FarmerId'];
    cluster = json['cluster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FarmerId_x'] = this.farmerIdX;
    data['TasteQuality'] = this.tasteQuality;
    data['price'] = this.price;
    data['Ratings'] = this.ratings;
    data['Quantity'] = this.quantity;
    data['cluster_x'] = this.clusterX;
    data['FarmerId_y'] = this.farmerIdY;
    data['cluster_y'] = this.clusterY;
    data['FarmerId'] = this.farmerId;
    data['cluster'] = this.cluster;
    return data;
  }
}