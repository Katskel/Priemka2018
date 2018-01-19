using EnrollmentWebApp.Domain.Abstract;
using EnrollmentWebApp.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnrollmentWebApp.Domain.Concrete
{
    public class EFDataRepository : IDataRepository
    {
        private EFDbContext context = new EFDbContext();

        public IEnumerable<Enrollee> Enrollees
        {
            get
            {
                return context.Enrollees;
            }
        }

        public IEnumerable<TreeNode> TreeNodes
        {
            get
            {
                return context.TreeNodes;
            }
        }

        public IEnumerable<SpecialityInfo> SpecialityInfo
        {
            get
            {
                return context.SpecialityInfo;
            }
        }

        public IEnumerable<Speciality> Specialities
        {
            get
            {
                return context.Specialities;
            }
        }


        public void SaveEnrollee(Enrollee enrollee)
        {
            if (enrollee.EnrolleeId == 0)
            {
                context.Enrollees.Add(enrollee);
            }
            else
            {
                Enrollee dbEntry = context.Enrollees.Find(enrollee.EnrolleeId);
                if (dbEntry != null)
                {
                    dbEntry.Name = enrollee.Name;
                    dbEntry.Surname = enrollee.Surname;
                    dbEntry.Patronymic = enrollee.Patronymic;
                    dbEntry.Passport = enrollee.Passport;
                    dbEntry.BirthDate = enrollee.BirthDate;
                    dbEntry.Town = enrollee.Town;
                    dbEntry.Address = enrollee.Address;
                    dbEntry.PhoneNumber = enrollee.PhoneNumber;
                    dbEntry.CTLanguage = enrollee.CTLanguage;
                    dbEntry.CTFirstSubject = enrollee.CTFirstSubject;
                    dbEntry.CTSecondSubject = enrollee.CTSecondSubject;
                    dbEntry.AverageScore = enrollee.AverageScore;
                    dbEntry.SpecialityId = enrollee.SpecialityId;
                }
            }
            context.SaveChanges();
        }
        public Enrollee DeleteEnrollee(int enrolleeID)
        {
            Enrollee dbEntry = context.Enrollees.Find(enrolleeID);
            if (dbEntry != null)
            {
                context.Enrollees.Remove(dbEntry);
                context.SaveChanges();
            }
            return dbEntry;
        }

        public void AddSpeciality(Speciality speciality)
        {
            Speciality dbSpeciality = context.Specialities.Find(speciality.Id);
            if(dbSpeciality != null)
            {
                dbSpeciality.UniversityId = speciality.UniversityId;
                dbSpeciality.FacultyId = speciality.FacultyId;
                dbSpeciality.SpecialityId = speciality.SpecialityId;
            }
            else
            {
                context.Specialities.Add(speciality);
            }
            context.SaveChanges();
        }
    }
}
