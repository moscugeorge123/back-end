using Entities;
using System;
using System.Collections.Generic;

#nullable disable

namespace Entities
{
    public partial class CourseStudent
    {
        public long CoursesCourseId { get; set; }
        public long StudentsStudentId { get; set; }

        public virtual Course CoursesCourse { get; set; }
        public virtual Student StudentsStudent { get; set; }
    }
}
