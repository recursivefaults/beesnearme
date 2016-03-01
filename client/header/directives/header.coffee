
HeaderDirective = () ->
    {
        templateUrl: "client/header/header.html"
        controller: "HeaderController"
        controllerAs: "header"
    }

angular.module('bees-near-me').directive 'beesHeader', HeaderDirective
