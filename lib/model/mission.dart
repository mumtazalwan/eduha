class MissionModel {
  String missionTitle;
  int missionPoint;

  MissionModel(this.missionTitle, this.missionPoint);
}

List<MissionModel> mission = [
  MissionModel("Finishing 2 straight course", 2),
  MissionModel("Finishing 6 straight course", 6),
  MissionModel("Finishing 12 straight course", 12),
];