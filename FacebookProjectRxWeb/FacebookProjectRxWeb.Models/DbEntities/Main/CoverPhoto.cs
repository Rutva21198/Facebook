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
    [Table("CoverPhotos",Schema="dbo")]
    public partial class CoverPhoto
    {
		#region CoverPhotoId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion CoverPhotoId Annotations

        public int CoverPhotoId { get; set; }

		#region CoverPhoto Annotations

        [Required]
		#endregion CoverPhoto Annotations

        public string CoverPhoto { get; set; }

		#region UserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion UserId Annotations

        public int UserId { get; set; }

		#region UserDetails Annotations

        [InverseProperty("CoverPhoto")]
		#endregion UserDetails Annotations

        public virtual ICollection<UserDetail> UserDetails { get; set; }


        public CoverPhoto()
        {
			UserDetails = new HashSet<UserDetail>();
        }
	}
}