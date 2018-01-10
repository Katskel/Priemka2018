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
        public DbSet<Faculty> Faculties { get; set; }
        public DbSet<Speciality> Specialities { get; set; }
        public DbSet<TreeNode> TreeNodes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Enrollee>().ToTable("Enrollees");
            modelBuilder.Entity<Faculty>().ToTable("Faculties");
            modelBuilder.Entity<Speciality>().ToTable("Specialities");
            modelBuilder.Entity<TreeNode>().ToTable("TreeNodes");

            modelBuilder.Entity<Enrollee>().HasKey(en => en.EnrolleeId);
            modelBuilder.Entity<Faculty>().HasKey(fa => fa.FacultyId);
            modelBuilder.Entity<Speciality>().HasKey(sp => sp.SpecialityId);
            modelBuilder.Entity<TreeNode>().HasKey(tn => tn.Id);

            modelBuilder.Entity<Faculty>()
                .HasMany(fa => fa.Specialities)
                .WithRequired(sp => sp.Faculty)
                .HasForeignKey(sp => sp.FacultyId);
        }
    }
}
