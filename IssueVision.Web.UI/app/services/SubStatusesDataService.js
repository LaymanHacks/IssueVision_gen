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

    var serviceId = 'subStatusesDataService';
    angular.module('app').service(serviceId, ['$http', subStatusesDataService]);

    function subStatusesDataService($http) {
        var urlBase = '/api/subStatuses';            

        this.getData = function () {
            return $http.get(urlBase  + '/all');
        };

         this.updateSubStatuses = function(subStatuses) {
            return $http.put(urlBase, subStatuses);
        };

         this.insertSubStatuses = function(subStatuses) {
            return $http.post(urlBase, subStatuses);
        };

         this.deleteSubStatuses = function(subStatusId) {
            return $http.Delete(urlBase, subStatusId);
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

        this.getDataBySubStatusId = function (subStatusId) {
            return $http.get(urlBase);
        };


    }
})();