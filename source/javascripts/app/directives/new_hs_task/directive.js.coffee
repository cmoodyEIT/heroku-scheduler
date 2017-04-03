# //= require app/directives/hs_task/controller
class NewHsTask extends AngularDirective
  restrict: 'E'
  templateUrl: '/views/directives/new_task.html'
  replace: true
  controller: Directives.NewTaskController
  @register(angular.app,'newHsTask')
