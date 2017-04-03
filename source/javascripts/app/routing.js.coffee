angular.app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: '/views/index.html'
      controller: 'HerokuScheduler'
  .otherwise
    redirectTo: '/'
