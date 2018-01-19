using EnrollmentWebApp.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EnrollmentWebApp.WebUI.Models
{
    public class EnrolleeEditViewModel
    {
        public Enrollee enrollee { get; set; }
        public Speciality speciality { get; set; }
    }
}