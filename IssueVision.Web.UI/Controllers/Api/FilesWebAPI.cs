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
    public class FilesApiController : ApiController
    {
        private readonly IFilesRepository _dbRepository;

        public FilesApiController(IFilesRepository dbRepository)
        {
            _dbRepository = dbRepository;
        }
   
                [Route("api/files/all", Name = "FilesGetDataRoute")]
        [HttpGet]
        public IQueryable<Files> GetData() 
        {
            return _dbRepository.GetData().AsQueryable();
        }

        [Route("api/files", Name = "FilesUpdateRoute")]
        [HttpPut]
        public void Update(Files files)
        {
            _dbRepository.Update( (Guid)files.FileID, files.IssueID,  (string)files.FileName,  (byte[])files.Data);
          }

        [Route("api/files", Name = "FilesInsertRoute")]
        [HttpPost]
        public Guid Insert(Files files)
        {
             return _dbRepository.Insert( (Guid)files.FileID, files.IssueID,  (string)files.FileName,  (byte[])files.Data);
          }

        [Route("api/files", Name = "FilesDeleteRoute")]
        [HttpDelete]
        public HttpResponseMessage Delete(Guid fileID)
        {
            try
            {
                 _dbRepository.Delete(fileID);
                 return Request.CreateResponse(HttpStatusCode.OK);
            }
                 catch (Exception)
            {
                 return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        [Route("api/files", Name = "FilesGetDataPageableRoute")]
        [HttpGet]
        public  HttpResponseMessage  GetDataPageable(String sortExpression, Int32 page, Int32 pageSize) 
        {
              if (page < 1) return Request.CreateResponse(HttpStatusCode.BadRequest);
            var results =_dbRepository.GetDataPageable(sortExpression, page, pageSize);
            var totalCount = _dbRepository.GetRowCount();
            var pagedResults = PagedResultHelper.CreatePagedResult(Request, "FilesGetDataPageableRoute", page,
                pageSize, totalCount, results);
            return Request.CreateResponse(HttpStatusCode.OK, pagedResults);
        }

        [Route("api/files/all", Name = "FilesGetDataByFileIDRoute")]
        [HttpGet]
        public IQueryable<Files> GetDataByFileID(Guid fileID) 
        {
            return _dbRepository.GetDataByFileID(fileID).AsQueryable();
        }

        [Route("api/issues/{issueID}/files/all", Name = "FilesGetDataByIssueIDRoute")]
        [HttpGet]
        public IQueryable<Files> GetDataByIssueID(Int64 issueID) 
        {
            return _dbRepository.GetDataByIssueID(issueID).AsQueryable();
        }

        [Route("api/issues/{issueID}/files", Name = "FilesGetDataByIssueIDPageableRoute")]
        [HttpGet]
        public  HttpResponseMessage  GetDataByIssueIDPageable(Int64 issueID, String sortExpression, Int32 page, Int32 pageSize) 
        {
              if (page < 1) return Request.CreateResponse(HttpStatusCode.BadRequest);
            var results =_dbRepository.GetDataByIssueIDPageable(issueID, sortExpression, page, pageSize);
            var totalCount = _dbRepository.GetDataByIssueIDRowCount(issueID);
            var pagedResults = PagedResultHelper.CreatePagedResult(Request, "FilesGetDataByIssueIDPageableRoute", page,
                pageSize, totalCount, results);
            return Request.CreateResponse(HttpStatusCode.OK, pagedResults);
        }


    }
}
