angular.module 'bees-near-me', [
    'angular-meteor',
    'ngRoute',
    'accounts.ui',
    'uiGmapgoogle-maps'
]

angular.module('bees-near-me').config ['$routeProvider', 'uiGmapGoogleMapApiProvider', ($routeProvider, mapsProvider) ->
    $routeProvider.when '/', {
        templateUrl: 'client/landing/landing.html'
        controller: 'LandingPageController'
    }

    $routeProvider.when '/register_keeper', {
        templateUrl: 'client/landing/register_keeper.html'
        controller: 'SigninController'
        controllerAs: "signin"
    }

    $routeProvider.when '/register_swarm', {
        templateUrl: 'client/landing/register_swarm.html'
        controller: 'RegistrationController'
        controllerAs: "registrar"
    }

    $routeProvider.when '/map', {
        templateUrl: 'client/map/map.html'
        controller: 'MapController'
        controllerAs: "map"
    }

    $routeProvider.when '/swarms/:swarm_id', {
        templateUrl: 'client/landing/register_swarm.html'
        controller: 'RegistrationController'
        controllerAs: "registrar"
    }

    mapsProvider.configure {
        key: 'AIzaSyBQMyvtbd56MQd_wYshtcKvht0rNMbJXEg'
        libraries: 'weather,geometry,visualization'
    }
]




