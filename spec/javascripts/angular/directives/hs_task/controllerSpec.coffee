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
    el = "<hs-task></hs-task>"
    res = _$compile_(el)($scope)
    controller = res.controller
    $http.flush()

  it 'should exist', ->
    expect(controller).toBeDefined()

  it 'should save scheduledJob', ->
    $scope.scheduledJob = {task: 'rake build_wall'}
    $scope.save()
    expect($scope.scheduledJob.$saved).toBe true
    expect($scope.scheduledJob.$editing).toBe false
