class Plant {
  final int id;
  final String name;
  final String type;
  final String botanicalName;
  final String imagePath;
  final DateTime lastWatered;
  final String healthStatus;

  //expressed in number of days
  final int wateringPlan;
  final int fertilizingPlan;
  final int pruningPlan;



  Plant(this.id, this.name, this.type, this.imagePath, this.lastWatered, this.wateringPlan, this.fertilizingPlan, this.pruningPlan, this.botanicalName, this.healthStatus);
}