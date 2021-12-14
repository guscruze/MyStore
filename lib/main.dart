import 'package:firebase_core/firebase_core.dart';
import 'package:aprendiendomystore/view/home_view.dart';
import 'package:aprendiendomystore/persistence/stores_dao.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  StoresDAO.addStoresFromServer().then((value){
    runApp(HomeView());
  });
}

