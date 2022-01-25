# local_database
> SQLite란 RDBMS를 응용프로그램에 넣어 제공하는 가벼운 소프트웨어 라이브러리.  
타 SQL 데이터베이스와 다르게 분리된 서버를 가지고 있지 않고, 일반 디스크 파일을 직접 읽고 쓰며 오직 하나의 파일에 멀티테이블, 색인, 트리거, 뷰 등을 가지고 있다.  
저장된 데이터는 data/data/패키지명/database 경로에 저장된다

![화면-기록-2022-01-13-17 41 18](https://user-images.githubusercontent.com/64571546/149296369-54469010-debc-418d-8a16-08decaf9592f.gif)

## dependencies  
**sqflite:** SQLite를 Android와 IOS에 동시에 지원   
**path_provider:** Android와 IOS에서 필요한 경로(db파일 저장위치) 알려주는 패키지  
**path:** 경로를 합칠 때 사용  

[참고영상](https://youtu.be/noi6aYsP7Go)

