using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using FacebookProjectRxWeb.Models.Enums.Main;
using FacebookProjectRxWeb.BoundedContext.SqlContext;
namespace FacebookProjectRxWeb.Models.Main
{
    [Table("EducationDetails",Schema="dbo")]
    public partial class EducationDetail
    {
		#region EducationId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion EducationId Annotations

        public int EducationId { get; set; }

		#region CourseName Annotations

        [Required]
        [MaxLength(100)]
		#endregion CourseName Annotations

        public string CourseName { get; set; }

		#region CollegeSchoolName Annotations

        [MaxLength(200)]
		#endregion CollegeSchoolName Annotations

        public string CollegeSchoolName { get; set; }

		#region UniversityBoardName Annotations

        [MaxLength(200)]
		#endregion UniversityBoardName Annotations

        public string UniversityBoardName { get; set; }

		#region City Annotations

        [MaxLength(50)]
		#endregion City Annotations

        public string City { get; set; }

		#region SchoolCollegeAO Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion SchoolCollegeAO Annotations

        public int SchoolCollegeAO { get; set; }

		#region CourseStartDate Annotations

        [Required]
		#endregion CourseStartDate Annotations

        public System.DateTime CourseStartDate { get; set; }

		#region CourseEndDate Annotations

        [Required]
		#endregion CourseEndDate Annotations

        public System.DateTime CourseEndDate { get; set; }

		#region UserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion UserId Annotations

        public int UserId { get; set; }


        public EducationDetail()
        {
        }
	}
}