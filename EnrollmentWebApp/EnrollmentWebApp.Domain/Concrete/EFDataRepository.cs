using EnrollmentWebApp.Domain.Abstract;
using EnrollmentWebApp.Domain.Entities;
using System;
using System.Collections.Generic;
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
    }
}
