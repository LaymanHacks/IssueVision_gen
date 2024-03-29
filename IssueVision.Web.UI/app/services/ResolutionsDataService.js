//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a tool.
//     Generated by Merlin Version: 1.0.0.0
//
//     Changes to this file may cause incorrect behavior and will be lost if 
//     the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------
(function () {
    'use strict';

    var serviceId = 'resolutionsDataService';
    angular.module('app').service(serviceId, ['$http', resolutionsDataService]);

    function resolutionsDataService($http) {
        var urlBase = '/api/resolutions';            

        this.getData = function () {
            return $http.get(urlBase  + '/all');
        };

         this.updateResolutions = function(resolutions) {
            return $http.put(urlBase, resolutions);
        };

         this.insertResolutions = function(resolutions) {
            return $http.post(urlBase, resolutions);
        };

         this.deleteResolutions = function(resolutionID) {
            return $http.Delete(urlBase, resolutionID);
        };

        this.getDataPageable = function (sortExpression, page, pageSize) { 
            return $http({
                 url: urlBase ,
                 method: 'GET',
                 params: {
                     sortExpression : sortExpression || '', 
                     page : page || '', 
                     pageSize : pageSize || ''
                 }
            });
        };

        this.getDataByResolutionID = function (resolutionID) {
            return $http.get(urlBase + '/' + resolutionID);
        };


    }
})();
