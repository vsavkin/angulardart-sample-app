part of talk_to_me;

class TalkToMeRouteInitializer implements RouteInitializer {
  init(Router router, ViewFactory view) {
    router.root
      ..addRoute(
          name: 'create',
          path: '/create',
          enter: view('views/create.html')
      )

      ..addRoute(
          name: 'list',
          path: '/list',
          enter: view('views/list.html'),
          defaultRoute: true,
          mount: (Route route) => route
            ..addRoute(
               name: 'show',
               path: "/:callId/show",
               enter: view('views/show.html'))
      );
  }
}