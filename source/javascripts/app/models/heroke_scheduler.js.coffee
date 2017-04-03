class HerokuScheduler extends AngularViewModel
  @register(angular.app)
  @inject('$http')
  initialize: ->
    @$http.get('/scheduledJobs.json')
    .then (response) =>
      for entry in response.data
        entry.last_run = new Date(entry.last_run)
        entry.next_run = new Date(entry.next_run)
      @$scope.scheduledJobs = response.data
