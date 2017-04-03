describe "HerokuSchedulerTaskDirective", ->

  $compile      = null
  $rootScope    = null
  $http         = null

  beforeEach(module('HerokuScheduler'))
  beforeEach inject (_$compile_,_$rootScope_,_$httpBackend_) ->
    $http      = _$httpBackend_
    $compile   = _$compile_
    $rootScope = _$rootScope_

  it 'should retrieve template and replace', ->
    $http.when('GET','/views/directives/task.html').respond ->
      return [200, '<this-result></this-result>']
    el = "<hs-task></hs-task>"
    res = $compile(el)($rootScope)
    $http.flush()
    expect(res[0].outerHTML).toContain ('<this-result>')
