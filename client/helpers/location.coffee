LocationService = ($q) =>
    @getLocation = () =>
        deferred = $q.defer()
        if navigator.geolocation
            navigator.geolocation.getCurrentPosition (position) ->
                deferred.resolve position
        else
            deferred.reject()
        deferred.promise


LocationService.$inject = ['$q']

angular.module('bees-near-me').factory 'LocationService', LocationService

        
