import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

//This class will contain all the data that will be processed by the graphs.

class DataSeries{
  String _age, _sex, _province;
  String _eyeDisabled,
      _earDisabled,
      _talkDisabled,
      _walkDisabled,
      _armDisabled,
      _intellectDisabled,
      _mindDisabled;

  DataSeries(
    this._age,
    this._sex,
    this._province,
    this._eyeDisabled,
    this._earDisabled,
    this._talkDisabled,
    this._walkDisabled,
    this._armDisabled,
    this._intellectDisabled,
    this._mindDisabled
  );

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
