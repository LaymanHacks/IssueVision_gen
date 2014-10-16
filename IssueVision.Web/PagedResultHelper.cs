using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Http.Routing;


namespace IssueVision.Web
{
    public static class PagedResultHelper
    {
        public static PagedResult<T> CreatePagedResult<T>(HttpRequestMessage request, string routeName, int requestedPage, int pageSize, int totalCount, ICollection<T> data)
        {
            var totalPages = (int)Math.Ceiling((double)totalCount / pageSize);

            var urlHelper = new UrlHelper(request);
            var prevLink = requestedPage > 1 ? urlHelper.Link(routeName, new { page = requestedPage - 1, pageSize }) : "";
            var nextLink = requestedPage < totalPages - 1 ? urlHelper.Link(routeName, new { page = requestedPage + 1, pageSize }) : "";

            var result = new PagedResult<T>
            {
                TotalCount = totalCount,
                PageCount = totalPages,
                PageSize = pageSize,
                CurrentPage = requestedPage,
                PrevPageLink = prevLink,
                NextPageLink = nextLink,
                Results = data
            };
            return result;
        }

    }
}
