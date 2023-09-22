
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/presentation/core/go_router_observer.dart';
import 'package:todo_app/presentation/pages/homepage/home_page.dart';

GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

var routes = GoRouter(
    initialLocation: '/home/dashboard',
    navigatorKey: _rootNavigatorKey,
    observers: [
      GoRouterObserver(),
    ],
    routes: [
      
      GoRoute(
          path: '/home',
          builder: (context, state) {
            return Container(
              color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.push('/home/settings');
                    },
                    child: const Icon(Icons.next_plan),
                  ),
                ],
              ),
            );
          }),
          ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            path: '/home/:tab',
            builder: (context, state) => HomePage(
              key: state.pageKey,
              tab: state.pathParameters['tab']!,
            ),
          )
        ],
      ),
          
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
