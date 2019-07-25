import 'dart:convert';

void main() {
//   MonthlyPlan mp = MonthlyPlan();
  PlanningFormModel pmf = PlanningFormModel();
//   print(mp.monthlyplantoJsonv2());
  print(pmf.PlanningFormModeltoJsonv2());
  
}
 class PlanningFormModel{
    String company;
    String department;
    List<String> costElements;
    Map<String, MonthlyPlan> ceToMpMap;
   MonthlyPlan mp = MonthlyPlan();
    
    String PlanningFormModeltoJsonv2(){
      
      String p = "";
       p = p + "{";
      p = p + "'company':"+this.company+",";
      p = p + "'department':"+this.department+",";
      p = p + "'costElements':[" +"'it'"+","+"'hr'"+","+"'legal'"+"],";
      p = p + "[{"+"'it':"+"${mp.monthlyplantoJsonv2()}"+"},";
      p = p +  "[{"+"'hr':"+"${mp.monthlyplantoJsonv2()}"+"},";
      p = p +  "[{"+"'legal':"+"${mp.monthlyplantoJsonv2()}"+"},";
      p = p + "}";
      p = json.encode(p);   
      return p;
    }
   }

class MonthlyPlan{
    String catagory;
    List<int> amountInMonth;
    List<int> hourInMonth ;
  
    

    String monthlyplantoJsonv2(){
      
      String s = "";
      s = s + "{";
      s = s + "'catgory':"+this.catagory+",";
      s = s + "'amountInMonth':[";
      for(int i in amountInMonth){
        s =s + "'" + i.toString() + "'," ;
      }
      s = s + "]";
      
       s = s + "'hourInMonth':[";
      for(int i in hourInMonth){
        s =s + "'" + i.toString() + "'," ;
      }
      s = s + "]}";
      
//       s = json.encode(s);
      return s;
      
    }
  
  }

