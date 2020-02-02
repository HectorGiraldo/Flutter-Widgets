

import 'package:flutter/material.dart';
 
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:componentes/src/pages/card_page.dart';
// import 'package:componentes/src/pages/home_temp.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,

      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: [
        const Locale('en'),
        const Locale('es'), 
        
      ],
      // home: HomePage()
      initialRoute: 'home',
      routes: getApplicationRoutes(),
      // onGenerateRoute: ( RouteSettings settings) {

      //   print( 'ruta llamada : ${ settings.name }');

      //   return MaterialPageRoute(
      //     builder: ( BuildContext context ) => CardPage()
      //   );
      // }
    );
  }
}