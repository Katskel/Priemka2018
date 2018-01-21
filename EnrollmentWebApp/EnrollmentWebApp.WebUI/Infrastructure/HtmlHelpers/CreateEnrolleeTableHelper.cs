using EnrollmentWebApp.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EnrollmentWebApp.WebUI.Infrastructure.HtmlHelpers
{
    public static class CreateEnrolleeTableHelper
    {
        public static MvcHtmlString CreateEnrolleeTable (List<Enrollee> enrollees)
        {
            string table = "<table class=\"table table-striped table-condensed table-bordered\">";
            table += "<tr><th>Surname</th><th class=\"text-right\">Name</th><th class=\"text-center\">Actions</th></tr>";
            table += "<tbody>";
            if (enrollees != null)
            {
                foreach (var item in enrollees)
                {
                    table += "<tr>";
                    table += "<td><a href=\"/Admin/Edit?EnrolleeId=" + item.EnrolleeId.ToString() + "\">" + item.Surname + "</a></td>";
                    table += "<td class=\"text-right\">" + item.Name + "</td>";
                    table += "<td class=\"text-center\"><form action=\"/Admin/Delete\" method=\"post\">";
                    table += "<input id=\"EnrolleeId\" name=\"EnrolleeId\" type=\"hidden\" value=\"" + item.EnrolleeId + "\">";
                    table += "<input type=\"submit\" class=\"btn btn-default btn-xs\" value=\"Delete\">";
                    table += "</form>";
                    table += "</td>";
                    table += "</tr>";
                }
            }
            table += "</tbody>";
            table += "</table>";
            return new MvcHtmlString(table.ToString());
        }
    }
}