
# counter starts at 0
Session.setDefault('counter', 0)

angular.module 'bees-near-me', ['angular-meteor', 'ngRoute']

angular.module('bees-near-me').config ($routeProvider) ->
    $routeProvider.when '/', {
        templateUrl: 'client/landing/landing.html'
        controller: 'LandingPageController'
    }

    $routeProvider.when '/register_keeper', {
        templateUrl: 'client/landing/register_keeper.html'
        controller: 'RegistrationController'
        controllerAs: "registrar"
    }

    $routeProvider.when '/register_swarm', {
        templateUrl: 'client/landing/register_swarm.html'
        controller: 'RegistrationController'
        controllerAs: "registrar"
    }



