RegistrationController = ($q) ->
    init = () =>
        @currentLat = null
        @currentLong = null
        @user = {}
        @createUser = createUser
        getLocation().then updateLocation

    createUser = () =>
        @user.swarmLocation = [@currentLat, @currentLong]
        @user.createdAt = new Date()
        @user.type = "swarm"
        Users.insert @user
        @user = {}

    updateLocation = (position) =>
        @currentLat = position.coords.latitude
        @currentLong = position.coords.longitude

    getLocation = ->
        promise = $q.defer()
        if navigator.geolocation
            navigator.geolocation.getCurrentPosition (position) ->
                promise.resolve position
        else
            promise.reject()
        promise.promise

    init()

    return

RegistrationController.$inject = ['$q']

        
angular.module('bees-near-me').controller 'RegistrationController', RegistrationController
