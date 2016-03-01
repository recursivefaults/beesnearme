MapsController = ($scope, $reactive, location, logger, mapIsReady) ->
    $reactive(@).attach($scope)

    init = () =>
        @centerPosition = {}
        @centerPosition.latitude = 0
        @centerPosition.longitude = 0
        logger.currentLevel = logger.LEVELS.debug
        @helpers(
            keepers: () =>
                Users.find(type: 'keeper')
            swarms: () =>
                Users.find(type: 'swarm')
        )
        @events = {}

        location().then (position) ->
            @centerPosition = position.coords
        mapIsReady.promise(1).then (instance) ->
            console.log instance


    init()


MapsController.$inject = ['$scope', '$reactive', 'LocationService', 'uiGmapLogger', 'uiGmapIsReady']

angular.module('bees-near-me').controller 'MapController', MapsController
    
