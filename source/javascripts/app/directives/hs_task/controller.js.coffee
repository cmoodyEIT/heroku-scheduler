class Directives.TaskController extends AngularViewModel
  @inject()
  save: ->
    @$scope.scheduledJob.$saved = true
    @$scope.scheduledJob.$editing = false
