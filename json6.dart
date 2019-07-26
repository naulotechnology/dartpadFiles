import 'dart:convert';

main() {
  PlanningFormModel pfm = PlanningFormModel();
  print(pfm.toString());
  print(pfm.PlanningFormModeltoJsonv2());
}

class PlanningFormModel {
  String Company;
  String Department;
  List<String> costElements;
  Map<String, MonthlyPlan> ceToMpMap;
  List<int> amtList;
  MonthlyPlan mPlan = new MonthlyPlan();

  String allCatagory;

  PlanningFormModel() {
    this.Company = "N Tech";
    this.Department = "Marketing";
    this.costElements = new List<String>();

    this.costElements.add("Transportation");
    this.costElements.add("Marketing");
    this.costElements.add("Human Resources");
    this.costElements.add("Information Technology");
    this.costElements.add("Legal");

    //instatiate the map to store monthly plan for each costEleemnts
    ceToMpMap = new Map<String, MonthlyPlan>();

    //mp = mp.getbykey(legal)
    //  mp=mp.amountInMonth

    for (String ce in this.costElements) {
      //creaete monthly plan for each cost element

      mPlan.category = ce;
      amtList = new List<int>();

      for (int i = 1; i < 13; i++) {
        //assign some amount to each of the 12 months
        amtList.add(i * 125);
      }
      mPlan.amountInMonth = amtList;

      List hr = new List<int>();

      for (int i = 1; i < 13; i++) {
        //assign some amount to each of the 12 months
        hr.add(i * 7);
      }
      mPlan.hourInMonth = hr;

      //add monthly plan for the is
      this.ceToMpMap[ce] = mPlan;
    }
    //assign month plan
    // this.ceToMpMap = ceToMpM;
  }

  String toString() {
    String planningFormInString = "Company = " +
        this.Company +
        "\n" +
        "DepartMent = " +
        this.Department +
        "\n";

    planningFormInString = planningFormInString + "Monthly Amount Plan\n";
    for (String ce in this.costElements) {
      planningFormInString = planningFormInString + ce + " ";

      MonthlyPlan mp = this.ceToMpMap[ce];

      for (int amount in mp.amountInMonth) {
        planningFormInString = planningFormInString + amount.toString() + "||";
      }

      planningFormInString = planningFormInString + "\n";
    }

    planningFormInString = planningFormInString + "Monthly hour Plan\n";
    for (String ce in this.costElements) {
      planningFormInString = planningFormInString + ce + " ";

      MonthlyPlan mp = this.ceToMpMap[ce];

      for (int hour in mp.hourInMonth) {
        planningFormInString = planningFormInString + hour.toString() + "||";
      }
      planningFormInString = planningFormInString + "\n";
    }
    return planningFormInString;
  }

  String PlanningFormModeltoJsonv2() {
    String p = "";
    p = p + "{";
    p = p + "'Company':" + "'${this.Company}'" + ",";
    p = p + "'Department':" + "'${this.Department}'" + ",";
    p = p + "'costElements':[" + "${mPlan.monthlyplantoJsonv2()}" + "},";
//       p = p + "[{"+"'it':"+"${mPlan.monthlyplantoJsonv2()}"+"},";
//       p = p +  "[{"+"'hr':"+"${mPlan.monthlyplantoJsonv2()}"+"},";
//       p = p +  "[{"+"'legal':"+"${mPlan.monthlyplantoJsonv2()}"+"},";
    p = p + "}";
    p = json.encode(p);
    return p;
  }
}

class MonthlyPlan {
  String category;
  List<int> amountInMonth;
  List<int> hourInMonth;

  String monthlyplantoJsonv2() {
    PlanningFormModel pfm = new PlanningFormModel();
    String s = "";
    for (String ce in pfm.costElements) {
      s = s + "{";
      s = s + "'" + ce + "':{";
      s = s + "'amountInMonth':[";
      for (int i in amountInMonth) {
        s = s + "'" + i.toString() + "',";
      }
      s = s + "]";

      s = s + "'hourInMonth':[";
      for (int i in hourInMonth) {
        s = s + "'" + i.toString() + "',";
      }
      s = s + "]}},";

      // s = json.encode(s);
    }

    return s;
  }
}
