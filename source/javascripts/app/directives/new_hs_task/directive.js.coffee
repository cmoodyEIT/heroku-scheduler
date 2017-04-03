class NewHsTask extends AngularDirective
  restrict: 'E'
  templateUrl: '/views/directives/new_task.html'
  replace: true
  @register(angular.app,'newHsTask')
