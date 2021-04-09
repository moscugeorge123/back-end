using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Entities
{
    public class Course
    {
        public Course()
        {
            this.Students = new HashSet<Student>();
        }
        public int CourseId{ get; set; }
        [Required]
        public string Name { get; set; }

        public virtual ICollection<Student> Students { get; set; }
    }
}
