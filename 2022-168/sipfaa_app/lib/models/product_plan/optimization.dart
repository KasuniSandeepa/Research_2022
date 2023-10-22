class OptimizationResult {
  int? freshQuantity;
  int? processQuantityA;
  int? processQuantityB;
  double? totalIncome;
  double? totalProfit;

  OptimizationResult({
    this.freshQuantity,
    this.processQuantityA,
    this.processQuantityB,
    this.totalIncome,
    this.totalProfit,
  });

  OptimizationResult.fromJson(Map json)
      : freshQuantity=json['freshQuantity'],
        processQuantityA=json['processQuantityA'],
        processQuantityB=json['processQuantityB'],
        totalIncome=json['totalIncome'],
        totalProfit=json['totalProfit']
  ;

}
