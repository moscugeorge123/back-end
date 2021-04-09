using HotDiggetyDog;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Entities
{
    public partial class Course
    {
        public Course()
        {
            CourseStudents = new HashSet<CourseStudent>();
        }

        public long CourseId { get; set; }
        public string Name { get; set; }
        [JsonIgnore]

        public virtual ICollection<CourseStudent> CourseStudents { get; set; }
    }
}
