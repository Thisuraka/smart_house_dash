class Calculations {
  static getWattage(int wattage) {
    return double.parse((wattage / 1000).toStringAsFixed(2));
  }

  static getCostPerKwh(double costPerKwh) {
    return costPerKwh / 10;
  }

  static getTotalCost(double costPerKwh, double wattage, int usageHours) {
    return (wattage * costPerKwh * usageHours).ceilToDouble();
  }
}
