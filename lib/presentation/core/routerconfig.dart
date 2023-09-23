import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/domain/entities/unique_id.dart';
import 'package:todo_app/presentation/core/go_router_observer.dart';
import 'package:todo_app/presentation/pages/dashboard/dash_board.dart';
import 'package:todo_app/presentation/pages/detail/todo_detail_page.dart';
import 'package:todo_app/presentation/pages/homepage/home_page.dart';
import 'package:todo_app/presentation/pages/overview/over_view.dart';
import 'package:todo_app/presentation/pages/settings/settings_page.dart';

GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

const String _basePath = '/home';

var routes = GoRouter(
    initialLocation: '$_basePath/${DashboardPage.pageConfig.name}',
    navigatorKey: _rootNavigatorKey,
    observers: [
      GoRouterObserver(),
    ],
    routes: [
      // GoRoute(
      //     name: SettingsPage.pageConfig.name,
      //     path: '$_basePath/${SettingsPage.pageConfig.name}',
      //     builder: (context, state) {
      //       return const SettingsPage();
      //     }),

      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            name: HomePage.pageConfig.name,
            path: '$_basePath/:tab',
            builder: (context, state) => HomePage(
              key: state.pageKey,
              tab: state.pathParameters['tab']!,
            ),
          )
        ],
      ),
      GoRoute(
          path: '$_basePath/overview/:collectionId',
          name: ToDoDetailPage.pageConfig.name,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Details"),
                leading: BackButton(onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.goNamed(HomePage.pageConfig.name,
                        pathParameters: {'tab': OverviewPage.pageConfig.name});
                  }
                }),
              ),
              body: ToDoDetailPageProvider(
                  collectionId: CollectionId.fromUniqueString(
                state.pathParameters['collectionId'] ?? '',
              )),
            );
          }),

      // GoRoute(
      //     path: '/home/settings',
      //     builder: (context, state) {
      //       return Container(
      //         color: Colors.amber,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             ElevatedButton(
      //               onPressed: () {
      //                 context.push('/home/start');
      //               },
      //               child: const Icon(Icons.next_plan),
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 context.pop('/home');
      //               },
      //               child: const Icon(Icons.restore_sharp),
      //             ),
      //           ],
      //         ),
      //       );
      //     }),
      // GoRoute(
      //     path: '/home/start',
      //     builder: (context, state) {
      //       return Container(
      //         color: Colors.blueGrey,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             ElevatedButton(
      //               onPressed: () {
      //                 context.push('/home/task');
      //               },
      //               child: const Icon(Icons.next_plan),
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 context.pop('/home/settings');
      //               },
      //               child: const Icon(Icons.restore_sharp),
      //             ),
      //           ],
      //         ),
      //       );
      //     }),
      // GoRoute(
      //     path: '/home/task',
      //     builder: (context, state) {
      //       return Container(
      //         color: Colors.red,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             ElevatedButton(
      //               onPressed: () {
      //                 context.push('/home');
      //               },
      //               child: const Icon(Icons.next_plan),
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 context.pop('/home/start');
      //               },
      //               child: const Icon(Icons.restore_sharp),
      //             ),
      //           ],
      //         ),
      //       );
      //     }),
    ]);
