import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../get_core/get_core.dart';
import '../../../get_instance/get_instance.dart';
import '../../../get_state_manager/get_state_manager.dart';
import '../../../get_state_manager/src/simple/list_notifier.dart';
import '../../../get_utils/get_utils.dart';
import '../../get_navigation.dart';
import 'root_controller.dart';

class GetMaterialApp extends StatelessWidget {
  const GetMaterialApp({
    Key? key,
    this.navigatorKey,
    this.home,
    Map<String, Widget Function(BuildContext)> this.routes =
        const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    List<NavigatorObserver> this.navigatorObservers =
        const <NavigatorObserver>[],
    this.builder,
    this.textDirection,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.fallbackLocale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.customTransition,
    this.translationsKeys,
    this.translations,
    this.onInit,
    this.onReady,
    this.onDispose,
    this.routingCallback,
    this.defaultTransition,
    this.getPages,
    this.opaqueRoute,
    this.enableLog,
    this.logWriterCallback,
    this.popGesture,
    this.transitionDuration,
    this.defaultGlobalState,
    this.smartManagement = SmartManagement.full,
    this.initialBinding,
    this.unknownRoute,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.actions,
    this.restorationScopeId,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        super(key: key);

  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeMode themeMode;
  final CustomTransition? customTransition;
  final Color? color;
  final Map<String, Map<String, String>>? translationsKeys;
  final Translations? translations;
  final TextDirection? textDirection;
  final Locale? locale;
  final Locale? fallbackLocale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final ThemeData? highContrastTheme;
  final ThemeData? highContrastDarkTheme;
  final Map<Type, Action<Intent>>? actions;
  final bool debugShowMaterialGrid;
  final ValueChanged<Routing?>? routingCallback;
  final Transition? defaultTransition;
  final bool? opaqueRoute;
  final VoidCallback? onInit;
  final VoidCallback? onReady;
  final VoidCallback? onDispose;
  final bool? enableLog;
  final LogWriterCallback? logWriterCallback;
  final bool? popGesture;
  final SmartManagement smartManagement;
  final Bindings? initialBinding;
  final Duration? transitionDuration;
  final bool? defaultGlobalState;
  final List<GetPage>? getPages;
  final GetPage? unknownRoute;
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final String? restorationScopeId;

  const GetMaterialApp.router({
    Key? key,
    this.routeInformationProvider,
    required RouteInformationParser<Object> this.routeInformationParser,
    required RouterDelegate<Object> this.routerDelegate,
    this.backButtonDispatcher,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.customTransition,
    this.translationsKeys,
    this.translations,
    this.textDirection,
    this.fallbackLocale,
    this.routingCallback,
    this.defaultTransition,
    this.opaqueRoute,
    this.onInit,
    this.onReady,
    this.onDispose,
    this.enableLog,
    this.logWriterCallback,
    this.popGesture,
    this.smartManagement = SmartManagement.full,
    this.initialBinding,
    this.transitionDuration,
    this.defaultGlobalState,
    this.getPages,
    this.unknownRoute,
    this.restorationScopeId,
  })  : navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null,
        super(key: key);

  Route<dynamic> generator(RouteSettings settings) =>
      PageRedirect(settings, unknownRoute).page();

  List<Route<dynamic>> initialRoutesGenerate(String name) =>
      [PageRedirect(RouteSettings(name: name), unknownRoute).page()];

  @override
  Widget build(BuildContext context) => GetBuilder<GetMaterialController>(
      init: Get.rootController,
      dispose: (d) {
        onDispose?.call();
      },
      initState: (i) {
        Get.engine!.addPostFrameCallback((timeStamp) {
          onReady?.call();
        });
        if (locale != null) Get.locale = locale;

        if (fallbackLocale != null) Get.fallbackLocale = fallbackLocale;

        if (translations != null) {
          Get.addTranslations(translations!.keys);
        } else if (translationsKeys != null) {
          Get.addTranslations(translationsKeys!);
        }

        Get.customTransition = customTransition;

        initialBinding?.dependencies();
        Get.addPages(getPages);
        Get.smartManagement = smartManagement;
        onInit?.call();

        Get.config(
          enableLog: enableLog ?? Get.isLogEnable,
          logWriterCallback: logWriterCallback,
          defaultTransition: defaultTransition ?? Get.defaultTransition,
          defaultOpaqueRoute: opaqueRoute ?? Get.isOpaqueRouteDefault,
          defaultPopGesture: popGesture ?? Get.isPopGestureEnable,
          defaultDurationTransition:
              transitionDuration ?? Get.defaultTransitionDuration,
        );
      },
      builder: (_) => routerDelegate != null
          ? MaterialApp.router(
              routerDelegate: routerDelegate!,
              routeInformationParser: routeInformationParser!,
              backButtonDispatcher: backButtonDispatcher,
              routeInformationProvider: routeInformationProvider,
              key: _.unikey,
              builder: (context, child) {
                return Directionality(
                  textDirection: textDirection ??
                      (rtlLanguages.contains(Get.locale?.languageCode)
                          ? TextDirection.rtl
                          : TextDirection.ltr),
                  child: builder == null ? child! : builder!(context, child),
                );
              },
              title: title,
              onGenerateTitle: onGenerateTitle,
              color: color,
              theme: _.theme ?? theme ?? ThemeData.fallback(),
              darkTheme:
                  _.darkTheme ?? darkTheme ?? theme ?? ThemeData.fallback(),
              themeMode: _.themeMode ?? themeMode,
              locale: Get.locale ?? locale,
              localizationsDelegates: localizationsDelegates,
              localeListResolutionCallback: localeListResolutionCallback,
              localeResolutionCallback: localeResolutionCallback,
              supportedLocales: supportedLocales,
              debugShowMaterialGrid: debugShowMaterialGrid,
              showPerformanceOverlay: showPerformanceOverlay,
              checkerboardRasterCacheImages: checkerboardRasterCacheImages,
              checkerboardOffscreenLayers: checkerboardOffscreenLayers,
              showSemanticsDebugger: showSemanticsDebugger,
              debugShowCheckedModeBanner: debugShowCheckedModeBanner,
              shortcuts: shortcuts,
              restorationScopeId: restorationScopeId,
            )
          : MaterialApp(
              key: _.unikey,
              navigatorKey:
                  (navigatorKey == null ? Get.key : Get.addKey(navigatorKey!)),
              home: home,
              routes: routes ?? const <String, WidgetBuilder>{},
              initialRoute: initialRoute,
              onGenerateRoute: (getPages != null ? generator : onGenerateRoute),
              onGenerateInitialRoutes: (getPages == null || home != null)
                  ? onGenerateInitialRoutes
                  : initialRoutesGenerate,
              onUnknownRoute: onUnknownRoute,
              navigatorObservers: (navigatorObservers == null
                  ? <NavigatorObserver>[
                      GetObserver(routingCallback, Get.routing)
                    ]
                  : <NavigatorObserver>[
                      GetObserver(routingCallback, Get.routing)
                    ]
                ..addAll(navigatorObservers!)),
              builder: (context, child) {
                return Directionality(
                  textDirection: textDirection ??
                      (rtlLanguages.contains(Get.locale?.languageCode)
                          ? TextDirection.rtl
                          : TextDirection.ltr),
                  child: builder == null ? child! : builder!(context, child),
                );
              },
              title: title,
              onGenerateTitle: onGenerateTitle,
              color: color,
              theme: _.theme ?? theme ?? ThemeData.fallback(),
              darkTheme:
                  _.darkTheme ?? darkTheme ?? theme ?? ThemeData.fallback(),
              themeMode: _.themeMode ?? themeMode,
              locale: Get.locale ?? locale,
              localizationsDelegates: localizationsDelegates,
              localeListResolutionCallback: localeListResolutionCallback,
              localeResolutionCallback: localeResolutionCallback,
              supportedLocales: supportedLocales,
              debugShowMaterialGrid: debugShowMaterialGrid,
              showPerformanceOverlay: showPerformanceOverlay,
              checkerboardRasterCacheImages: checkerboardRasterCacheImages,
              checkerboardOffscreenLayers: checkerboardOffscreenLayers,
              showSemanticsDebugger: showSemanticsDebugger,
              debugShowCheckedModeBanner: debugShowCheckedModeBanner,
              shortcuts: shortcuts,
              restorationScopeId: restorationScopeId,
              //   actions: actions,
            ));
}

class GetInformationParser extends RouteInformationParser<GetPage> {
  @override
  SynchronousFuture<GetPage> parseRouteInformation(
      RouteInformation routeInformation) {
    if (routeInformation.location == '/') {
      return SynchronousFuture(Get.routeTree.routes.first);
    }
    print('route location: ${routeInformation.location}');
    final page = Get.routeTree.matchRoute(routeInformation.location!);
    print(page.parameters);
    final val = page.route!.copy(
      name: routeInformation.location,
      parameter: Map.from(page.parameters),
    );
    return SynchronousFuture(val);
  }

  @override
  RouteInformation restoreRouteInformation(GetPage uri) {
    print('restore $uri');

    return RouteInformation(location: uri.name);
  }
}

class GetNav {
  GetNav({GetDelegate? routerDelegate, required this.pages})
      : routerDelegate = routerDelegate ?? GetDelegate() {
    Get.registerRoutes(pages);
    Get.addKey(this.routerDelegate.navigatorKey);
  }

  Future<T?> toNamed<T>(String route) {
    return routerDelegate.toNamed(route);
  }

  Future<T?> pushRoute<T>(
    GetPage route, {
    bool removeUntil = false,
    bool replaceCurrent = false,
    bool rebuildStack = true,
  }) {
    return routerDelegate.pushRoute(route,
        removeUntil: removeUntil,
        replaceCurrent: replaceCurrent,
        rebuildStack: rebuildStack);
  }

  Future<bool> popRoute() {
    return routerDelegate.popRoute();
  }

  Future<T?> offUntil<T>(String route) {
    return routerDelegate.offUntil(route);
  }

  final GetDelegate routerDelegate;
  final GetInformationParser routeInformationParser = GetInformationParser();
  final List<GetPage> pages;
}

class GetDelegate extends RouterDelegate<GetPage>
    with
        // ignore: prefer_mixin
        ListNotifier,
        PopNavigatorRouterDelegateMixin<GetPage> {
  final List<GetPage> routes = <GetPage>[];

  final GetPage? notFoundRoute;

  final List<NavigatorObserver>? dipNavObservers;
  final TransitionDelegate<dynamic>? transitionDelegate;

  GetDelegate(
      {this.notFoundRoute, this.dipNavObservers, this.transitionDelegate});

  /// Called by the [Router] at startup with the structure that the
  /// [RouteInformationParser] obtained from parsing the initial route.
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: routes.toList(),
      observers: [GetObserver()],
      transitionDelegate:
          transitionDelegate ?? const DefaultTransitionDelegate<dynamic>(),
    );
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setInitialRoutePath(GetPage configuration) async {
    return pushRoute(configuration);
  }

  @override
  Future<void> setNewRoutePath(GetPage configuration) {
    routes.clear();
    return pushRoute(configuration);
  }

  /// Called by the [Router] when it detects a route information may have
  /// changed as a result of rebuild.
  @override
  GetPage get currentConfiguration {
    final route = routes.last;
    return route;
  }

  Future<T?> toNamed<T>(String route) {
    final page = Get.routeTree.matchRoute(route);
    if (page.route != null) {
      return pushRoute(page.route!.copy(name: route));
    } else {
      return pushRoute(_notFound());
    }
  }

  Future<T?> offUntil<T>(String route) {
    final page = Get.routeTree.matchRoute(route);
    if (page.route != null) {
      return pushRoute(page.route!.copy(name: route), removeUntil: true);
    } else {
      return pushRoute(_notFound());
    }
  }

  GetPage _notFound() {
    return notFoundRoute ??
        GetPage(
          name: '/404',
          page: () => Scaffold(
            body: Text('not found'),
          ),
        );
  }

  Future<T?> pushRoute<T>(
    GetPage route, {
    bool removeUntil = false,
    bool replaceCurrent = false,
    bool rebuildStack = true,
  }) async {
    route = route.copy(unknownRoute: _notFound());
    assert(!(removeUntil && replaceCurrent),
        'Only removeUntil or replaceCurrent should by true!');
    if (removeUntil) {
      routes.clear();
    } else if (replaceCurrent && routes.isNotEmpty) {
      routes.removeLast();
    }
    _addRoute(route);
    if (rebuildStack) {
      refresh();
    }
  }

  @override
  Future<bool> popRoute() {
    if (routes.length > 1) {
      _removePage(routes.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  bool canPop() {
    return routes.isNotEmpty;
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    routes.remove(route.settings);
    refresh();
    return true;
  }

  void _removePage(GetPage page) {
    routes.remove(page);

    refresh();
  }

  void _addRoute(GetPage route) {
    routes.add(
      route,
    );
    refresh();
  }

  void addRoutes(List<GetPage> pages) {
    routes.addAll(pages);
    refresh();
  }
}
