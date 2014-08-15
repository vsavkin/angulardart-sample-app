part of talk_to_me;

void talkToMeRouteInitializer(Router router, RouteViewFactory view) {
  view.configure({
    'create' : ngRoute(
      path: '/create',
      viewHtml: '<create-call></create-call>'
    ),
    'list' : ngRoute(
       path: '/list',
       viewHtml: '<list></list>',
       defaultRoute: true,
       mount: {
         "show" : ngRoute(
            path: '/:callId/show',
            viewHtml: '<show-call></show-call>'
         )
       }
    )
  });
}