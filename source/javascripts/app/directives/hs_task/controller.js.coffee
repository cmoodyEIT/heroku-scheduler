class Directives.TaskController extends AngularViewModel
  @inject()
  save: ->
    @$scope.scheduledJob.$saved = true
    @$scope.scheduledJob.$editing = false
  edit: ->
    @_scheduledJob = {}
    for key,val of @$scope.scheduledJob
      continue if key[0] in ['$','_']
      @_scheduledJob[key] = val
    @$scope.scheduledJob.$saved = false
    @$scope.scheduledJob.$editing = true
  cancel: ->
    for key,val of @_scheduledJob || {}
      continue if key[0] in ['$','_']
      @$scope.scheduledJob[key] = val
    @$scope.scheduledJob.$saved = true
    @$scope.scheduledJob.$editing = false
  delete: ->
    index = @$scope.scheduledJobs.indexOf(@$scope.scheduledJob)
    @$scope.scheduledJobs.splice(index,1)
