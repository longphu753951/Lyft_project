import 'package:app_dat_xe/src/model/car_item.dart';

class CarUtils {
  static List<CarItem> cars;

  static List<CarItem> getCarList(){
    if(cars != null){
      return cars;
    }

    cars = new List();
    cars.add(CarItem("Motorbike", "assets/motorbike.png", 1.5));
    cars.add(CarItem("Car", "assets/car.png", 2));
    cars.add(CarItem("Premium car", "assets/premium_car.png", 2.5));
    cars.add(CarItem("Sport car", "assets/sport_car.png", 3));

    return cars;
  }
}