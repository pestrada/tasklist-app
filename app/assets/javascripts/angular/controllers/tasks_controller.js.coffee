App.controller 'TasksController', ['$scope', 'Task', ($scope, Task) ->
  $scope.tasks = Task.query()
]