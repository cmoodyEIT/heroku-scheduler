describe "HerokuScheduler", ->

  controller = null
  $scope     = null
  $http      = null

  beforeEach(module('HerokuScheduler'))
  beforeEach inject (_$controller_,_$rootScope_, _$httpBackend_) ->
    $http      = _$httpBackend_
    $scope     = _$rootScope_.$new()
    controller = _$controller_("HerokuScheduler",{$scope: $scope})

  it 'should exist', ->
    expect(controller).toBeDefined()

  it 'should set scheduledJobs on load', ->
    $http.when('GET','/scheduledJobs.json').respond (m,u,d,h,p) ->
      return [200, [{},{},{}]]
    $http.flush()
    expect($scope.scheduledJobs.length).toBe 3

  it 'should convert strings to dates', ->
    a = new Date
    res = [{next_run: a},{last_run: a}]
    $http.when('GET','/scheduledJobs.json').respond (m,u,d,h,p) ->
      return [200, JSON.stringify(res)]
    $http.flush()
    expect(a <= $scope.scheduledJobs[0].next_run <= a).toBe true
    expect(a <= $scope.scheduledJobs[1].last_run <= a).toBe true
    expect(a <= $scope.scheduledJobs[0].last_run <= a).toBe false
