abstract class Service {
  void checkEngineCondition();
}

enum fuelType { petrol, diesel }

class Engine implements Service {
  fuelType fuel;
  int horsePower = 0;
  int efficiency = 0;

  Engine(this.fuel, this.horsePower, this.efficiency);

  void checkEngineCondition() {
    print("Good for all ");
  }

  void start() {
    print("Start Engine !");
  }

  //void start();

  void stop() {
    print("Stop engine !");
  }
  //void stop();

  void displayDetails() {
    print(
        "fuelType : ${fuel}, horsePower : ${horsePower}, efficiency : ${efficiency}");
  }
  //void displayDetails();
}

class CarEngine extends Engine {
  int numberOfCylinders = 0;
  int cc = 0;
  String model = "";

  CarEngine(super.fuel, super.horsePower, super.efficiency,
      this.numberOfCylinders, this.cc, this.model);

  // void start(){
  //   print("Engine started !");
  // }

  // void stop(){
  //   print("Engine stopped !");
  // }

  factory CarEngine.xuv300(fuelType fuel) {
    return CarEngine(fuel, 3750, 60, 4, 1500, "SUV");
  }

  factory CarEngine.xuv500(fuelType fuel) {
    return CarEngine(fuel, 4750, 70, 6, 2000, "SUV");
  }

  factory CarEngine.xuv700(fuelType fuel) {
    return CarEngine(fuel, 5750, 80, 8, 2500, "SUV");
  }

  void checkEngineCondition() {
    if (super.efficiency == "fuelType.petrol") {
      print("Good");
    } else {
      print("Bad");
    }
  }

  void displayDetails() {
    print(
        "Model - Car Engine \nFuel Type : ${fuel}, Horse Power : ${horsePower}, Efficiency : ${efficiency}, number of cylinders : ${numberOfCylinders}, cc : ${cc} and model : ${model} ");
  }
}

class TruckEngine extends Engine {
  int CargoCapacityInTons = 0;

  TruckEngine(super.fuelType, super.horsePower, super.efficiency,
      this.CargoCapacityInTons);

  void displayDetails() {
    print(
        "Model - Truck Engine \nfuelType : ${fuelType}, HorsePower : ${horsePower}, Efficiency : ${efficiency}, Car Capacity : ${CargoCapacityInTons}");
  }
}

class SuperCarEngine extends CarEngine {
  bool hasTurbo = true;
  List<String> specialFeatures = [];
  int topSpeed = 0;

  SuperCarEngine(
      super.fuelType,
      super.horsePower,
      super.efficiency,
      super.numberOfCylinders,
      super.cc,
      super.model,
      bool hasTurbo,
      List<String> specialFeatures,
      int topSpeed);

  void displayDetails() {
    print(
        "Model - SuperCar Engine \n Fuel Type : ${fuelType}, Horse Power : ${horsePower}, Efficiency : ${efficiency}, number of cylinders : ${numberOfCylinders}, cc : ${cc} and model : ${model}, Turbo : ${hasTurbo}, Special Features : ${specialFeatures}, top speed : ${topSpeed}");
  }
}

extension convertToSuperCarExtension on CarEngine {
  SuperCarEngine convertToSuperCar() {
    SuperCarEngine superCarEngine = new SuperCarEngine(fuel, 1200, 96, 6, 1400,
        'Porche Cayman', true, ['Acceleration', 'Airbags'], 300);
    return superCarEngine;
  }
}

void main() {
  Engine ferrariEngine = new Engine(fuelType.petrol, 4000, 900);
  ferrariEngine.displayDetails();

  CarEngine mercedesEngine =
      new CarEngine(fuelType.diesel, 1200, 90, 6, 1200, "Benz");
  mercedesEngine.start();
  mercedesEngine.stop();
  mercedesEngine.displayDetails();

  CarEngine xuv300Petrol = CarEngine.xuv300(fuelType.petrol);
  CarEngine xuv500Petrol = CarEngine.xuv500(fuelType.petrol);
  CarEngine xuv700Petrol = CarEngine.xuv700(fuelType.petrol);

  CarEngine xuv300Diesel = CarEngine.xuv300(fuelType.diesel);
  CarEngine xuv500Diesel = CarEngine.xuv500(fuelType.diesel);
  CarEngine xuv700Diesel = CarEngine.xuv700(fuelType.diesel);

  xuv300Petrol.displayDetails();
  xuv500Petrol.displayDetails();
  xuv700Petrol.displayDetails();

  xuv300Diesel.displayDetails();
  xuv500Diesel.displayDetails();
  xuv700Diesel.displayDetails();

  //4
  xuv700Diesel.checkEngineCondition();

  //5
  TruckEngine truckEngine = new TruckEngine(fuelType.diesel, 5000, 90, 1000);
  truckEngine.displayDetails();

  //
  SuperCarEngine superCarEngine = new SuperCarEngine(fuelType.petrol, 900, 95,
      12, 2000, "Super Car", true, ["Acceleration", "Airbags"], 300);
  superCarEngine.displayDetails();

  //
  CarEngine xuv500Petrol2 = CarEngine.xuv500(fuelType.petrol);
  xuv500Petrol2.displayDetails();

  xuv500Petrol2 = xuv500Petrol2.convertToSuperCar();
  xuv500Petrol2.displayDetails();
}
