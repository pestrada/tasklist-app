App.controller 'TasksController', ['$scope', ($scope) ->
  $scope.tasks = [
      {'id':1, 'description':'task1'},
      {'id':2, 'description':'task2'}
    ]
]