# //= require app/directives/hs_task/controller
class HsTask extends AngularDirective
  restrict: 'E'
  templateUrl: '/views/directives/task.html'
  replace: true
  controller: Directives.TaskController
  @register(angular.app,'hsTask')
