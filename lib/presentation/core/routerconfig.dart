import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/presentation/core/go_router_observer.dart';

GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
var routes = GoRouter(
    initialLocation: '/home',
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
      GoRoute(
          path: '/home/settings',
          builder: (context, state) {
            return Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.push('/home/start');
                    },
                    child: const Icon(Icons.next_plan),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.pop('/home');
                    },
                    child: const Icon(Icons.restore_sharp),
                  ),
                ],
              ),
            );
          }),
      GoRoute(
          path: '/home/start',
          builder: (context, state) {
            return Container(
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.push('/home');
                    },
                    child: const Icon(Icons.next_plan),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.pop('/home/settings');
                    },
                    child: const Icon(Icons.restore_sharp),
                  ),
                ],
              ),
            );
          }),
    ]);
