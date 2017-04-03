class Directives.NewTaskController extends AngularViewModel
  @inject()
  toggle: ->

  save: ->
    @$scope.scheduledJob.$saved = true
    @$scope.scheduledJob.$editing = false
    @$scope.scheduledJob.id = 1
    @$scope.scheduledJobs.push(angular.copy(@$scope.scheduledJob))
    @$scope.scheduledJob = {}
    @$scope.creating = false
  edit: ->
    @$scope.creating = true
    @$scope.scheduledJob = {}
    @$scope.scheduledJob.$saved = false
    @$scope.scheduledJob.$editing = true
  cancel: ->
    @$scope.scheduledJob = {}
    @$scope.creating = false
