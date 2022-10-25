import 'package:app_contacts/src/repositories/ContactRepositoy.dart';

main(){
  test();
}

void test()async{
  final repository = ContactRepository();
  final list = await repository.fetchCotacts();
  print(list[0].title);
}