# provider_example

- 여러페이지에서 같은 값을 공유하려면 최상단을 거쳐 전달해야하는데 그런방식은 코드가 복잡해 지기 쉽다
- 상태저장소를 따로 빼두어서 해당 값을 사용하는 위젯에 값을 제공한다
- 값이 변경되면 상태저장소 내의 값을 변경한뒤 notifyListeners() 함수를 통해 알린다 
- 상태값을 변경하더라도 notifyListeners()를 호출하지 않으면 값이 적용되지 않기 때문에 notifyListeners()를 포함한 메소드를 만들어서 값을변경한다
- 직접 값을 변경하지 못하도록 상태값을 private변수로 선언한다
- 상태값이 List인경우 하나하나의 요소의 속성을 변경하기 위해 해당값을 Model에 선언하고, Model내부에 값변경 메소드를 선언한다
- showModalBottomSheet(): 하단에서 올라오는 모달

> 상태관리에는 수많은 방법이 있다. 그중 하나인 Provider 패키지를 이용한 상태관리 예제코드이다.

[참고 강의](https://www.udemy.com/course/flutter-bootcamp-with-dart/)



