import 'dart:convert';

List<String> CategoryModelfromJson(String str) {
  print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
  print(json.decode(str)[0]);
  return List<String>.from(json.decode(str).map((x) {
    return x.toString();
  }));
}
