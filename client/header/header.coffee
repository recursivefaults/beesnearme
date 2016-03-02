
HeaderController = ($scope, $reactive) ->
    $reactive(@).attach($scope)

    @helpers({
        swarms: () =>
            Swarms.find().count()
        keepers: () =>
            Keepers.find().count()
    })

    return

HeaderController.$inject = ['$scope', '$reactive']

angular.module('bees-near-me').controller 'HeaderController', HeaderController
