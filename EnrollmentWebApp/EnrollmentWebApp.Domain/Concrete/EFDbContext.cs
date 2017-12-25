using EnrollmentWebApp.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnrollmentWebApp.Domain.Concrete
{
    public class EFDbContext : DbContext
    {
        public DbSet<Enrollee> Enrollees { get; set; }
    }
}
