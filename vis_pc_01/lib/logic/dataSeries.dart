/* Author: Andrés Cornejo
 * Class: DataSeries
 * Description: Generates an object that contains all the information given by the source json.
 *              It is meant to be used in a list.
 */


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

  }

  factory DataSeries.fromJSON(Map<String,dynamic> json){
    if(json == null){
      print("Error handling json file");
      return null;
    } else {
      return DataSeries(
        json["age"],
        json["eyes"],
        json["ears"],
        json["talk"],
        json["walk"],
        json["arms"],
        json["intellect"],
        json["mental"],
        json["sex"],
        json["province"]
      );
    }
  }

  String toString(){
    String output =  "Age group: " + this.age + "\n";
    output += "Eye dis: " + this._eyeDisabled.toString() + "\n";
    output += "Ears dis: " + this._earDisabled.toString() + "\n";
    output += "Talk dis: " + this._talkDisabled.toString() + "\n";
    output += "Walk dis: " + this._walkDisabled.toString() + "\n";
    output += "Arm dis: " + this._armDisabled.toString() + "\n";
    output += "Intellect dis: " + this._intellectDisabled.toString() + "\n";
    output += "Mental dis: " + this._mindDisabled.toString() + "\n";
    output += "Sex: " + this._sex + "\n";
    output += "Province: " + this._province + "\n";
    output += "\n";

    return output;
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
