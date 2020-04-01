//This class will contain all the data that will be processed by the graphs.

class DataSeries{
  String _age, _sex, _province;
  var _eyeDisabled,
      _earDisabled,
      _talkDisabled,
      _walkDisabled,
      _armDisabled,
      _intellectDisabled,
      _mindDisabled;

  DataSeries(String pAge, String pEyes, String pEars, String pTalk,
      String pWalk, String pArm, String pIntel, String pMind,
      String pSex, String pProvince){

    this._age = pAge;
    this._sex =  pSex;
    this._province = pProvince;

    this._eyeDisabled = int.tryParse(pEyes) ?? -1;

    this._earDisabled = int.tryParse(pEars) ?? -1;

    this._talkDisabled = int.tryParse(pTalk) ?? -1;

    this._walkDisabled = int.tryParse(pWalk) ?? -1;

    this._armDisabled = int.tryParse(pArm) ?? -1;

    this._intellectDisabled = int.tryParse(pIntel) ?? -1;

    this._mindDisabled = int.tryParse(pMind) ?? -1;

    print(this._mindDisabled);
  }

  factory DataSeries.fromJSON(Map<String,dynamic> json){
    if(json == null){
      return null;
    } else {
      return DataSeries(
        json["age"],
        json["eyeDisabled"],
        json["earDisabled"],
        json["talkDisabled"],
        json["walkDisabled"],
        json["armDisabled"],
        json["intellectDisabled"],
        json["mindDisabled"],
        json["sex"],
        json["province"]
      );
    }
  }

  get age => this._age;
  get eyeDisabled => this._eyeDisabled;
  get earDisabled => this._earDisabled;
  get talkDisabled => this._talkDisabled;
  get walkDisabled => this._walkDisabled;
  get armDisabled => this._armDisabled;
  get intellectDisabled => this._intellectDisabled;
  get mindDisabled => this._mindDisabled;
  get sex => this._sex;
  get province => this._province;

}
