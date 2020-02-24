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
    [Table("UserWorks",Schema="dbo")]
    public partial class UserWork
    {
		#region UserWorkId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion UserWorkId Annotations

        public int UserWorkId { get; set; }

		#region WorkName Annotations

        [Required]
        [MaxLength(100)]
		#endregion WorkName Annotations

        public string WorkName { get; set; }


        public string WorkDescription { get; set; }

		#region UserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion UserId Annotations

        public int UserId { get; set; }


        public Nullable<System.DateTime> WorkStartDate { get; set; }


        public Nullable<System.DateTime> WorkEndDate { get; set; }


        public UserWork()
        {
        }
	}
}