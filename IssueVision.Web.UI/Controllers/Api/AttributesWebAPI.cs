//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a tool.
//     Generated by Merlin Version: 1.0.0.0
//
//     Changes to this file may cause incorrect behavior and will be lost if 
//     the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------
using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IssueVision.Data.Repository;
using IssueVision.Domain.Entities;

namespace IssueVision.Web.UI.Controllers.Api
{
    public class AttributesApiController : ApiController
    {
        private readonly IAttributesRepository _dbRepository;

        public AttributesApiController(IAttributesRepository dbRepository)
        {
            _dbRepository = dbRepository;
        }

        [Route("api/attributes/all", Name = "AttributesGetDataRoute")]
        [HttpGet]
        public IQueryable<Attributes> GetData()
        {
            return _dbRepository.GetData().AsQueryable();
        }

        [Route("api/attributes", Name = "AttributesUpdateRoute")]
        [HttpPut]
        public void Update(Attributes attributes)
        {
            _dbRepository.Update((Guid)attributes.ID, attributes.IssueID, (string)attributes.AttributeName, (string)attributes.Value);
        }

        [Route("api/attributes", Name = "AttributesInsertRoute")]
        [HttpPost]
        public Guid Insert(Attributes attributes)
        {
            return _dbRepository.Insert((Guid)attributes.ID, attributes.IssueID, (string)attributes.AttributeName, (string)attributes.Value);
        }

        [Route("api/attributes", Name = "AttributesDeleteRoute")]
        [HttpDelete]
        public HttpResponseMessage Delete(Guid iD)
        {
            try
            {
                _dbRepository.Delete(iD);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        [Route("api/attributes", Name = "AttributesGetDataPageableRoute")]
        [HttpGet]
        public HttpResponseMessage GetDataPageable(String sortExpression, Int32 page, Int32 pageSize)
        {
            if (page < 1) return Request.CreateResponse(HttpStatusCode.BadRequest);
            var results = _dbRepository.GetDataPageable(sortExpression, page, pageSize);
            var totalCount = _dbRepository.GetRowCount();
            var pagedResults = PagedResultHelper.CreatePagedResult(Request, "AttributesGetDataPageableRoute", page,
                pageSize, totalCount, results);
            return Request.CreateResponse(HttpStatusCode.OK, pagedResults);
        }

        [Route("api/attributes/all", Name = "AttributesGetDataByIDRoute")]
        [HttpGet]
        public IQueryable<Attributes> GetDataByID(Guid iD)
        {
            return _dbRepository.GetDataByID(iD).AsQueryable();
        }

        [Route("api/issues/{issueID}/attributes/all", Name = "AttributesGetDataByIssueIDRoute")]
        [HttpGet]
        public IQueryable<Attributes> GetDataByIssueID(Int64 issueID)
        {
            return _dbRepository.GetDataByIssueID(issueID).AsQueryable();
        }

        [Route("api/issues/{issueID}/attributes", Name = "AttributesGetDataByIssueIDPageableRoute")]
        [HttpGet]
        public HttpResponseMessage GetDataByIssueIDPageable(Int64 issueID, String sortExpression, Int32 page, Int32 pageSize)
        {
            if (page < 1) return Request.CreateResponse(HttpStatusCode.BadRequest);
            var results = _dbRepository.GetDataByIssueIDPageable(issueID, sortExpression, page, pageSize);
            var totalCount = _dbRepository.GetDataByIssueIDRowCount(issueID);
            var pagedResults = PagedResultHelper.CreatePagedResult(Request, "AttributesGetDataByIssueIDPageableRoute", page,
                pageSize, totalCount, results);
            return Request.CreateResponse(HttpStatusCode.OK, pagedResults);
        }


    }
}