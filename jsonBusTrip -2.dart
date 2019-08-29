import 'dart:convert';

void main() {
  List passengers = new List<Passenger >();
  
  List yatru1 = new List<Passenger >();
// Passenger pi = new Passenger();
 Passenger p;
String dat;
  for (int i = 0; i < 10; i++) {
      p = new Passenger("p.name" , "p.address");
    p.name =  i.toString() + 'name';
     p.address = i.toString() + 'address';
  // pi.age = i + 5 ;
    

    passengers.add(p);
    
  }
 for(Passenger p in passengers){
           Map<String, dynamic> pJson = p.toJson();
   dat = pJson.toString();
   print(dat);
//      yatru.add(dat);
//    print(yatru);
    }
  
  BusTrip bT = new BusTrip(origin: '"kathmandu" ', destination: '"pokhara"' , yatru : passengers);
  Map<String, dynamic> bTJson = bT.toJson();
  String data = bTJson.toString();

 // BusTrip bT2 = BusTrip.fromJson(json.decode(data));

  print(data);
// print(bT2.origin);

//print(passengers.pi.name);
//print(user);
}

class Passenger {
  String name;
  String address;
  // int age;
   Passenger(this.name, this.address,);
  Map<String, dynamic> toJson() => _passengerToJson(this);
  

  
}


Map<String, dynamic> _passengerToJson(Passenger pa) {
  return <String, dynamic>{
    'name': pa.name,
    'address': pa.address,
   // 'yatru': instance.yatru,
  };
}


class BusTrip {
  String origin;
  String destination;
  List<Passenger> yatru = new List<Passenger>();

  Map<String, dynamic> toJson() => _busTripToJson(this);
 BusTrip({this.origin, this.destination, this.yatru});

  factory BusTrip.fromJson(Map<String, dynamic> json) => _itemFromJson(json);
}

Map<String, dynamic> _busTripToJson(BusTrip instance) {
  return <String, dynamic>{
    '"origin"': instance.origin,
    '"destination"': instance.destination,
     '"yatru"': instance.yatru,
  };
}

BusTrip _itemFromJson(Map<String, dynamic> json) {
  return BusTrip(
    origin: json['origin'] as String,
    destination: json['destination'] as String,
    yatru : json['yatru'] as List,
  );
}
