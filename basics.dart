

int multiply(int number1,int number2){
  
  return number1*number2;
}

bool isOdd(int number){
  
  if(number%2 == 1){
    return true;
  }
  return false;
}

class Person{

  String name = "";

  Person(String name){
    this.name =  name;
  }

  void display(){
    print("My name is $name");
  }
}

void divide(double number1,double number2){

  try {
    if(number2 ==  0){
      throw Exception("Divide by zero Exception");
    }
    print(number1/number2);

  } catch (e) {
    print(e);
  }

}

double getVolumeOfBox(double length,double width,[double height=1.0]){
  return length*width*height;
}



void main(){
  
  //1
  String message = "Hello Dart";
  print(message);

  //is even or oddd

//2
  int number = 24;
  (number%2) == 0 ? print("It is Odd") : print("It is even");
  

//3
  List<String> fuits = ['Apple', 'Banana', 'Orange', 'Grapes'];
  for(var index = 0;index<fuits.length;index++){
    print(fuits[index]);
  }

//4
  int mulipliedResult = multiply(5,2);
  print(mulipliedResult);

  //5
  Person person = Person("Gaurav Wani");
  person.display();

  //6
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 22,
  };

  var ageEntries = ages.entries;

  for(var entry in ageEntries){
   String name = entry.key;
    int age = entry.value;
    print("$name is $age years old ");
  }


  //7
  divide(5,0);

  //8
  List<int> numbers = [1,2,3,2,4,5,1,6];

  for(int firstIndex = 0;firstIndex < numbers.length-1;firstIndex++){
    
    for(int secondIndex = firstIndex+1;secondIndex<numbers.length;secondIndex++){
      
      if(numbers[firstIndex] == numbers[secondIndex]){
        numbers.removeAt(secondIndex);
      }
    }
  }  
  print(numbers);

  //9
  int number2 = -8;

  (number2 > 0) ? print("It is positive") : number2 < 0 ? print("It is negative") : print("It is zero");

  //10
  int dayNumber = 3;
  switch(dayNumber){

    case 1 : 
      print("Monday");
      break;
    case 2 : 
      print("Tuesday");
      break;
    case 3 : 
      print("Wednesday");
      break;
    case 4 : 
      print("Thursday");
      break;
    case 5 : 
      print("Friday");
      break;
    case 6 : 
      print("Saturday");
      break;
    case 7 : 
      print("Sunday");
      break;
    default : 
      print("Invalid Day Number");
      break;
    
  }

//11
String month = "January";

  switch(month){

    case "January" : 
    case "Feb":
    case "March":
      print("Winter");
      break;

    case "April" : 
    case "May":
    case "June":
      print("Sprint");
      break;

    case "July" : 
    case "August":
    case "September":
      print("Summer");
      break;

    case "October" : 
    case "November":
    case "December":
      print("Fall");
      break;
    
    default : 
      print("Invalid month");
      break;
    
  }

  //12
  List<int> numberList = [1,2,3,4,5,6,7,8,9,10];

  for(int index = 0;index < numberList.length;index++){
    if(numberList[index]%2== 0){
      continue;
    }
    print(numberList[index]);
  }

  //13
  List<int> signedNumbers = [5, 8, -3, 10, -7, 2];
  for(int index = 0;index < signedNumbers.length;index++){
    if(signedNumbers[index]<0){
      print("First negative element occurs at $index position");
      break;
    }
  }  

  //14
  double volumeOfBox = getVolumeOfBox(10,10);
  print(volumeOfBox);

  //15
  List<int> filteredList = numberList.where((element) => element%2 == 0).toList();
  print(filteredList);
  
  //16
  List<int> numberList1 = [1,2,3,4];
  List<int> numberList2 = [-1,-2,-3,-4];
  List<int> finalNumberList = [...numberList2,...numberList1];
  print(finalNumberList);


}

