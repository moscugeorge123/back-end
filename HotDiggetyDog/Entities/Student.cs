using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Entities
{
    public class Student
    {
        public Student()
        {
            this.Courses = new HashSet<Course>();
        }
        public int StudentId{ get; set; }
        [Required]
        public string Name{ get; set; }
        public virtual ICollection<Course> Courses { get; set; }
    }
}
