// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plants_matter/src/data/myplants.dart';


import 'screens/myplants_screen.dart';
import 'screens/plantprofile.dart';
import 'screens/homepage.dart';
import 'screens/scaffold.dart';
import 'widgets/fade_transition_page.dart';
import '/material_theme.dart';
import 'package:google_fonts/google_fonts.dart';





final appShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'app shell');
final plantsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'plants shell');
final texttheme = TextTheme(
    //Body Small
     bodySmall:GoogleFonts.montserrat(
       fontSize: 13,fontWeight: FontWeight.w600, color: Colors.black),
                
    //Body Medium
      bodyMedium: GoogleFonts.montserrat(
       fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),

    //Body Large
      bodyLarge: GoogleFonts.aBeeZee(
        fontSize: 19,  fontWeight: FontWeight.w800, color: Colors.white),

  );

class Plantsmatter extends StatefulWidget {
  const Plantsmatter({super.key});
  
  

  @override
  State<Plantsmatter> createState() => _PlantsmatterState();
}

class _PlantsmatterState extends State<Plantsmatter> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      theme: MaterialTheme(texttheme).light(),
      darkTheme: MaterialTheme(texttheme).dark(),
      routerConfig: GoRouter(
        debugLogDiagnostics: true,
        initialLocation: '/home',
        routes: [
          ShellRoute(
            navigatorKey: appShellNavigatorKey,
            builder: (context, state, child) {
              return PlantsmatterScaffold(
                selectedIndex: switch (state.uri.path) {
                  var p when p.startsWith('/home') => 0,
                  var p when p.startsWith('/search') => 1,
                  var p when p.startsWith('/myplants') => 2,
                  _ => 0,
                },
                child: child,
              );
            },
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) {
                  return FadeTransitionPage<dynamic>(
                    key: state.pageKey,
                    child: Builder(builder: (context) {
                      return HomePageScreen(
                        onTap: (plant) {
                        },
                      );
                    }),
                  );
                },
            
              ),
              GoRoute(
                path: '/myplants',
                pageBuilder: (context, state) {
                  return FadeTransitionPage<dynamic>(
                    key: state.pageKey,
                    child: Builder(builder: (context) {
                      return MyPlantsScreen(
                        onTap: (plant) {
                          GoRouter.of(context)
                              .go('/myplants/plant/${plant.id}');
                        },
                      );
                    }),
                  );
                },
                routes: [
                      GoRoute(
                        path: 'plant/:plantId',
                        parentNavigatorKey: appShellNavigatorKey,
                        builder: (context, state) {
                          return PlantProfileScreen(
                            plant: myPlantsInstance
                                .getPlant(state.pathParameters['plantId'] ?? ''),
                          );
                        },
                      ),
                    ],
              ),
            
            ],
          ),
        ],
      ),
    );
  }
}


