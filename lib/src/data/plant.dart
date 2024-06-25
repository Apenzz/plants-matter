class Plant {
  final int id;
  final String name;
  final String type;
  final String botanicalName;
  final String imagePath;
  DateTime lastWatered;
  String healthStatus;

  //expressed in number of days
  int wateringPlan;
  int fertilizingPlan;
  int pruningPlan;



  Plant(this.id, this.name, this.type, this.imagePath, this.lastWatered, this.wateringPlan,
   this.fertilizingPlan, this.pruningPlan, this.botanicalName, this.healthStatus);

  setWateringPlan(int newplan) {
    wateringPlan=newplan;
  }
  setFertilizingPlan(int newplan) {
    fertilizingPlan=newplan;
  }
  setPruningPlan(int newplan) {
    pruningPlan=newplan;
  }   


}