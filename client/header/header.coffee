
HeaderController = ($scope, $reactive) ->
    $reactive(@).attach($scope)

    @helpers({
        swarms: () =>
            Users.find(type: 'swarm').count()

    })

    return

HeaderController.$inject = ['$scope', '$reactive']

angular.module('bees-near-me').controller 'HeaderController', HeaderController
