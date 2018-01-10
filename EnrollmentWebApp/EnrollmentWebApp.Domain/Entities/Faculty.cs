using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnrollmentWebApp.Domain.Entities
{
    public class Faculty
    {
        public int FacultyId { get; set; }
        public string Name { get; set; }
        public virtual IList<Speciality> Specialities { get; set; }
    }
}
