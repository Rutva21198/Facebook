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
    [Table("ApplicationObjectType",Schema="dbo")]
    public partial class ApplicationObjectType
    {
		#region ApplicationObjectITypeId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ApplicationObjectITypeId Annotations

        public int ApplicationObjectITypeId { get; set; }

		#region ApplicationObjectTypeName Annotations

        [Required]
        [MaxLength(100)]
		#endregion ApplicationObjectTypeName Annotations

        public string ApplicationObjectTypeName { get; set; }


        public ApplicationObjectType()
        {
        }
	}
}