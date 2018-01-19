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
        public DbSet<SpecialityInfo> SpecialityInfo { get; set; }
        public DbSet<Speciality> Specialities { get; set; }
        public DbSet<TreeNode> TreeNodes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Enrollee>().ToTable("Enrollees");
            modelBuilder.Entity<TreeNode>().ToTable("TreeNodes");
            modelBuilder.Entity<Speciality>().ToTable("Specialities");
            modelBuilder.Entity<SpecialityInfo>().ToTable("SpecialityInfo");

            modelBuilder.Entity<Enrollee>().HasKey(en => en.EnrolleeId);
            modelBuilder.Entity<TreeNode>().HasKey(tn => tn.NodeId);
            modelBuilder.Entity<Speciality>().HasKey(spec => spec.Id);
            modelBuilder.Entity<SpecialityInfo>().HasKey(specInf => specInf.Id);

        }
    }
}
