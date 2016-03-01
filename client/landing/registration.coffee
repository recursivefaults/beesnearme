RegistrationController = ($q, location) ->
    init = () =>
        @currentLat = null
        @currentLong = null
        @user = {}
        @createUser = createUser
        location().then updateLocation

    createUser = () =>
        @user.swarmLocation = [@currentLat, @currentLong]
        @user.createdAt = new Date()
        @user.type = "swarm"
        Users.insert @user
        @user = {}

    updateLocation = (position) =>
        @currentLat = position.coords.latitude
        @currentLong = position.coords.longitude

    init()

    return

RegistrationController.$inject = ['$q', 'LocationService']

        
angular.module('bees-near-me').controller 'RegistrationController', RegistrationController
