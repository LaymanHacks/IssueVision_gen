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
using IssueVision.Data.DbCommandProvider;
using IssueVision.Data.Repository;
using IssueVision.Domain.Entities;

namespace IssueVision.Web.UI.Controllers.Api
{
    public class SecurityQuestionsApiController : ApiController
    {
        private readonly ISecurityQuestionsRepository _dbRepository;

        public SecurityQuestionsApiController(ISecurityQuestionsRepository dbRepository)
        {
            _dbRepository = dbRepository;
        }
   
                [Route("api/securityQuestions/all", Name = "SecurityQuestionsGetDataRoute")]
        [HttpGet]
        public IQueryable<SecurityQuestions> GetData() 
        {
            return _dbRepository.GetData().AsQueryable();
        }

        [Route("api/securityQuestions", Name = "SecurityQuestionsUpdateRoute")]
        [HttpPut]
        public void Update(SecurityQuestions securityQuestions)
        {
            _dbRepository.Update( (string)securityQuestions.PasswordQuestion);
          }

        [Route("api/securityQuestions", Name = "SecurityQuestionsInsertRoute")]
        [HttpPost]
        public String Insert(SecurityQuestions securityQuestions)
        {
             return _dbRepository.Insert( (string)securityQuestions.PasswordQuestion);
          }

        [Route("api/securityQuestions", Name = "SecurityQuestionsDeleteRoute")]
        [HttpDelete]
        public HttpResponseMessage Delete(String passwordQuestion)
        {
            try
            {
                 _dbRepository.Delete(passwordQuestion);
                 return Request.CreateResponse(HttpStatusCode.OK);
            }
                 catch (Exception)
            {
                 return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        [Route("api/securityQuestions", Name = "SecurityQuestionsGetDataPageableRoute")]
        [HttpGet]
        public  HttpResponseMessage  GetDataPageable(String sortExpression, Int32 page, Int32 pageSize) 
        {
              if (page < 1) return Request.CreateResponse(HttpStatusCode.BadRequest);
            var results =_dbRepository.GetDataPageable(sortExpression, page, pageSize);
            var totalCount = _dbRepository.GetRowCount();
            var pagedResults = PagedResultHelper.CreatePagedResult(Request, "SecurityQuestionsGetDataPageableRoute", page,
                pageSize, totalCount, results);
            return Request.CreateResponse(HttpStatusCode.OK, pagedResults);
        }

        [Route("api/securityQuestions/{passwordQuestion}", Name = "SecurityQuestionsGetDataByPasswordQuestionRoute")]
        [HttpGet]
        public IQueryable<SecurityQuestions> GetDataByPasswordQuestion(String passwordQuestion) 
        {
            return _dbRepository.GetDataByPasswordQuestion(passwordQuestion).AsQueryable();
        }


    }
}