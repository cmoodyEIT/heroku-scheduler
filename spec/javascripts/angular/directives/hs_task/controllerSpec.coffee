describe "HerokuSchedulerTask", ->

  controller = null
  $scope     = null
  $http      = null

  beforeEach(module('HerokuScheduler'))
  beforeEach inject (_$controller_,_$rootScope_, _$httpBackend_,_$compile_) ->
    $http      = _$httpBackend_
    $scope     = _$rootScope_.$new()
    $http.when('GET','/views/directives/task.html').respond ->
      return [200, '<this-result></this-result>']
    el = angular.element("<hs-task></hs-task>")
    res = _$compile_(el)($scope)
    $http.flush()
    $scope.$digest()

  it 'should save scheduledJob', ->
    $scope.scheduledJob = {task: 'rake build_wall'}
    $scope.save()
    expect($scope.scheduledJob.$saved).toBe true
    expect($scope.scheduledJob.$editing).toBe false

  it 'should edit scheduledJob', ->
    $scope.scheduledJob = {}
    $scope.edit()
    expect($scope.scheduledJob.$saved).toBe false
    expect($scope.scheduledJob.$editing).toBe true

  it 'should cancel editing scheduledJob', ->
    $scope.scheduledJob = {task: 'rake break_wall'}
    $scope.edit()
    $scope.scheduledJob.task = 'rake build_wall'
    $scope.cancel()
    expect($scope.scheduledJob.$saved).toBe true
    expect($scope.scheduledJob.$editing).toBe false
    expect($scope.scheduledJob.task).toBe 'rake break_wall'

  it 'should edit scheduledJob', ->
    a = {task: 'task'}
    $scope.scheduledJobs = [{},a]
    $scope.scheduledJob = $scope.scheduledJobs[0]
    $scope.delete()
    expect($scope.scheduledJobs[0]).toBe a
    expect($scope.scheduledJobs.length).toBe 1
