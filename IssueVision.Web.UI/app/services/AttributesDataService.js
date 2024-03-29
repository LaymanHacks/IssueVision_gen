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

    var serviceId = 'attributesDataService';
    angular.module('app').service(serviceId, ['$http', attributesDataService]);

    function attributesDataService($http) {
        var urlBase = '/api/attributes';            

        this.getData = function () {
            return $http.get(urlBase  + '/all');
        };

         this.updateAttributes = function(attributes) {
            return $http.put(urlBase, attributes);
        };

         this.insertAttributes = function(attributes) {
            return $http.post(urlBase, attributes);
        };

         this.deleteAttributes = function(iD) {
            return $http.Delete(urlBase, iD);
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

        this.getDataByID = function (iD) {
            return $http.get(urlBase  + '/all');
        };

        this.getDataByIssueID = function (issueID) {
            return $http.get('/api/issues/' + issueID + '/attributes/all');
        };

        this.getDataByIssueIDPageable = function (issueID, sortExpression, page, pageSize) { 
            return $http({
                 url: '/api/issues/' + issueID + '/attributes',
                 method: 'GET',
                 params: {
                     issueID : issueID || '', 
                     sortExpression : sortExpression || '', 
                     page : page || '', 
                     pageSize : pageSize || ''
                 }
            });
        };


    }
})();
