MapsController = ($scope, $reactive, location, logger, mapIsReady) ->
    $reactive(@).attach($scope)

    init = () =>
        logger.currentLevel = logger.LEVELS.debug
        @centerPosition = {}
        @centerPosition.latitude = 0
        @centerPosition.longitude = 0
        @zoom = 8
        @clickMarker = clickMarker
        @events = {

        }

        @selected = null

        @helpers({
            swarms: () =>
                Swarms.find()
            keepers: () =>
                Swarms.find({type: 'keeper'})
        })

        location().then (position) ->
            @centerPosition = position.coords
        .then () ->
            mapIsReady.promise(1)
        .then (maps) ->
            @map = maps[0].map
            @map.setCenter {lat:@centerPosition.latitude, lng: @centerPosition.longitude}

    clickMarker = (marker, name, model) =>
        console.log model
        @selected = model

    init()

    return


MapsController.$inject = ['$scope', '$reactive', 'LocationService', 'uiGmapLogger', 'uiGmapIsReady']

angular.module('bees-near-me').controller 'MapController', MapsController
    
