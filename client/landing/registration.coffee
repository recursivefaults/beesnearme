RegistrationController = (location, $routeParams) ->
    init = () =>
        @currentLat = null
        @currentLong = null
        @swarm ||= {}
        if $routeParams.swarm_id?
            @swarm = Swarms.findOne($routeParams.swarm_id)
        @createUser = createUser
        location().then updateLocation

    createUser = () =>
        @swarm.swarmLocation = [@currentLat, @currentLong]
        @swarm.createdAt = new Date()
        @swarm.coords = { latitude: @currentLat, longitude: @currentLong }
        Swarms.insert @swarm
        @swarm = {}

    updateLocation = (position) =>
        @currentLat = position.coords.latitude
        @currentLong = position.coords.longitude

    init()

    return

RegistrationController.$inject = ['LocationService', '$routeParams']

        
angular.module('bees-near-me').controller 'RegistrationController', RegistrationController
