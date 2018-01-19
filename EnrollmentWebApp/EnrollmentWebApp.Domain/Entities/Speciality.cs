using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnrollmentWebApp.Domain.Entities
{
    public class Speciality : IEquatable<Speciality>
    {
        public int Id { get; set; }
        public int UniversityId { get; set; }
        public int FacultyId { get; set; }
        public int SpecialityId { get; set; }

        public bool Equals(Speciality obj)
        {
            return UniversityId == obj.UniversityId &&
                   FacultyId == obj.FacultyId &&
                   SpecialityId == obj.SpecialityId;
        }
    }
}
