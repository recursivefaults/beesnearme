MapsController = ($scope, $reactive, location, logger, mapIsReady) ->
    $reactive(@).attach($scope)

    init = () =>
        logger.currentLevel = logger.LEVELS.debug
        @centerPosition = {}
        @centerPosition.latitude = 0
        @centerPosition.longitude = 0
        @zoom = 8
        @events = {

        }

        @helpers({
            swarms: () =>
                Users.find({type: 'swarm'})
            keepers: () =>
                Users.find({type: 'keeper'})
        })

        location().then (position) ->
            @centerPosition = position.coords
        .then () ->
            mapIsReady.promise(1)
        .then (maps) ->
            @map = maps[0].map
            @map.setCenter {lat:@centerPosition.latitude, lng: @centerPosition.longitude}

    init()

    return


MapsController.$inject = ['$scope', '$reactive', 'LocationService', 'uiGmapLogger', 'uiGmapIsReady']

angular.module('bees-near-me').controller 'MapController', MapsController
    
