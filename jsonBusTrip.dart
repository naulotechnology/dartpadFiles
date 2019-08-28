import 'dart:convert';

void main() {
  List passengers = new List<Passenger >();
 Passenger pi = new Passenger();
 // Passenger p = new Passenger();

  for (int i = 0; i < 10; i++) {
   //  Passenger pi = new Passenger();
    pi.name =  i.toString() + 'name';
//     pi.address = i.toString() + 'address';
//     pi.age = i + 5 ;
    

    passengers.add(pi);
    
  }

  BusTrip bT = new BusTrip(origin: '"kathmandu" ', destination: '"pokhara"' , yatru : passengers);
  Map<String, dynamic> bTJson = bT.toJson();
  String data = bTJson.toString();

 // BusTrip bT2 = BusTrip.fromJson(json.decode(data));

  print(data);
// print(bT2.origin);

print(passengers.pi.name);
//print(user);
}

class Passenger {
  String name;
//   String address;
//   int age;
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
