using System;
using System.Collections.Generic;

#nullable disable

namespace Entities
{
    public partial class Student
    {
        public Student()
        {
            CourseStudents = new HashSet<CourseStudent>();
        }

        public long StudentId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<CourseStudent> CourseStudents { get; set; }
    }
}
