using System;
using Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Data
{
    public partial class hotdogappContext : DbContext
    {
        public hotdogappContext()
        {
        }

        public hotdogappContext(DbContextOptions<hotdogappContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<CourseStudent> CourseStudents { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlite("Data Source=hotdogapp.db");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Course>(entity =>
            {
                entity.Property(e => e.Name).IsRequired();
            });

            modelBuilder.Entity<CourseStudent>(entity =>
            {
                entity.HasKey(e => new { e.CoursesCourseId, e.StudentsStudentId });

                entity.ToTable("CourseStudent");

                entity.HasIndex(e => e.StudentsStudentId, "IX_CourseStudent_StudentsStudentId");

                entity.HasOne(d => d.CoursesCourse)
                    .WithMany(p => p.CourseStudents)
                    .HasForeignKey(d => d.CoursesCourseId);

                entity.HasOne(d => d.StudentsStudent)
                    .WithMany(p => p.CourseStudents)
                    .HasForeignKey(d => d.StudentsStudentId);
            });

            modelBuilder.Entity<Student>(entity =>
            {
                entity.Property(e => e.Name).IsRequired();
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
