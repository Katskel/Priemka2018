using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace EnrollmentWebApp.Domain.Entities
{
    public class Enrollee
    {
        public int EnrolleeId { get; set; }
        [Required(ErrorMessage = "Please enter your name")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Please enter your surname")]
        public string Surname { get; set; }
        [Required(ErrorMessage = "Please enter your patronymic name")]
        public string Patronymic { get; set; }
        [Required(ErrorMessage = "Please enter your passport number")]
        public string Passport { get; set; }
        [Required(ErrorMessage = "Please enter your birthdate")]
        public DateTime BirthDate { get; set; }
        [Required(ErrorMessage = "Please enter your town")]
        public string Town { get; set; }
        [Required(ErrorMessage = "Please enter your address")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Please enter your phone number")]
        public string PhoneNumber { get; set; }
        [Range(0, 100, ErrorMessage = "Please enter number in 0..100 interval")]
        public int CTLanguage { get; set; }
        [Range(0, 100, ErrorMessage = "Please enter number in 0..100 interval")]
        public int CTFirstSubject { get; set; }
        [Range(0, 100, ErrorMessage = "Please enter number in 0..100 interval")]
        public int CTSecondSubject { get; set; }

        [Required(ErrorMessage = "Please enter your average score in school")]
        [Range(0, 10.0, ErrorMessage = "Please enter average score in 0..10 interval")]
        public decimal AverageScore { get; set; }
    }
}
