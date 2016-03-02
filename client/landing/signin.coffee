SigninController = (location) ->
    init = () =>
        @signIn = signIn
        @facebookSignIn = facebookSignIn
        @errors = null
        @isRegistering = false
        @beginRegistration = () => @isRegistering = !@isRegistering
        @register = register
        @currentPosition = null

        location().then (position) =>
            @currentPosition = position.coords

    register = () =>
        user = {}
        user.email = @email
        user.password = @password
        user.profile = @profile
        user.profile.location = [@currentPosition.latitude, @currentPosition.longitude]
        user.profile.coords = {lat: @currentPosition.latitude, lng: @currentPosition.longitude}
        Accounts.createUser user, (error) ->
            console.log error
    facebookSignIn = () =>
        Meteor.loginWithFacebook()

    handleLoginError = (error) =>
        console.log error
        @errors = "Invalid user name or password"
        @email = ""
        @password = ""

    signIn = () =>
        @errors = null
        Meteor.loginWithPassword @email, @password, handleLoginError
        

    init()

    
    return

SigninController.$inject = ['LocationService']


angular.module('bees-near-me').controller 'SigninController', SigninController
