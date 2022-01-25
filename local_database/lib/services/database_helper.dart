import 'dart:async';
import 'dart:io';
import 'package:local_database/models/post.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String tableName = 'post';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory(); // path_provider 라이브러리를 통해 각 플랫폼의 위치를 가져오고, 경로를 만든다
    String path = join(documentsDirectory.path, '$tableName.db');
    return await openDatabase( // sqflite 라이브러리를 통해 경로를 불러오고 없다면 onCreate함수가 실행된다
      path,
      version: 1,
      onCreate: _onCreate,
      // migration이 필요하다면 onUpgrade 함수를 구현한다
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE post(
      id INTEGER PRIMARY KEY,
      price TEXT,
      content TEXT
    )
    ''');
  }

  // 추가
  Future<int> add(Post post) async {
    Database db = await instance.database;
    return await db.insert(tableName, post.toMap());
    // 필요하다면 아래처럼 직접 쿼리를 작성할수도 있다
    // return await db.rawInsert('INSERT INTO $tableName(name) VALUES(?)', [name]);
  }


  // 조회
  Future<List<Post>> getPosts() async {
    Database db = await instance.database;
    var posts = await db.query(tableName, orderBy: 'id');
    List<Post> answerTempList = posts.isNotEmpty
        ? posts.map((c) => Post.fromMap(c)).toList()
        : [];
    return answerTempList;
  }

  // 수정
  Future<int> update(Post post) async {
    Database db = await instance.database;
    return await db.update(tableName, post.toMap(),
        where: 'id = ?', whereArgs: [post.id]);
  }

  // 삭제
  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  // 전체 삭제
  Future<void> removeAll() async {
    Database db = await instance.database;
    db.rawDelete('DELETE FROM post');
  }
}