class Plant {
  final int id;
  final String name;
  final String type;
  final String botanicalName;
  final String imagePath;
  DateTime lastWatered;
  String healthStatus;

  // Expressed in number of days
  int wateringPlan;
  int fertilizingPlan;
  int pruningPlan;

  final String origin;
  final String production;
  final String category;
  final String blooming;
  final String color;
  final String size;
  final String soil;
  final String sunlight;
  final String watering;
  final String fertilization;
  final String pruning;

  Plant(
    this.id,
    this.name,
    this.type,
    this.imagePath,
    this.lastWatered,
    this.wateringPlan,
    this.fertilizingPlan,
    this.pruningPlan,
    this.botanicalName,
    this.healthStatus,
    this.origin,
    this.production,
    this.category,
    this.blooming,
    this.color,
    this.size,
    this.soil,
    this.sunlight,
    this.watering,
    this.fertilization,
    this.pruning,
  );

  void setWateringPlan(int newPlan) {
    wateringPlan = newPlan;
  }

  void setFertilizingPlan(int newPlan) {
    fertilizingPlan = newPlan;
  }

  void setPruningPlan(int newPlan) {
    pruningPlan = newPlan;
  }
}
