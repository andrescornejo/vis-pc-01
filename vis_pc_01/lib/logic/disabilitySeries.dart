/* Author: Andrés Cornejo
 * Class: DisabilitySeries
 * Description: Generates an object that contains the statistics of specific disabilities.
 *              It's meant to be used in a list, to be fed to the chart library.
 */

class DisabilitySeries{
  String type, sex, ageGroup, province;
  int amount;

  DisabilitySeries(this.type, this.sex,
      this.ageGroup, this.province, this.amount);

  String toString(){
    String output = "Disability type: " + this.type + "\n";
    output += "Age group: " + this.ageGroup + "\n";
    output += "Amount: " + this.amount.toString() + "\n";
    output += "Sex: " + this.sex + "\n";
    output+= "Province:" + this.province + "\n";
    output+= "\n";

    return output;
  }

}