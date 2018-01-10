using EnrollmentWebApp.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnrollmentWebApp.Domain.Abstract
{
    public interface IDataRepository
    {
        IEnumerable<Enrollee> Enrollees { get; }
        IEnumerable<TreeNode> TreeNodes { get; }
        IEnumerable<Faculty> Faculties { get; }
        IEnumerable<Speciality> Specialities { get; }

        void SaveEnrollee(Enrollee enrollee);
        Enrollee DeleteEnrollee(int enrolleeID);
    }
}
