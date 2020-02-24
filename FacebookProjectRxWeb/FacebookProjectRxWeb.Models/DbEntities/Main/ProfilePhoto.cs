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
    [Table("ProfilePhotos",Schema="dbo")]
    public partial class ProfilePhoto
    {
		#region ProfilePhotoId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ProfilePhotoId Annotations

        public int ProfilePhotoId { get; set; }

		#region ProfiePhoto Annotations

        [Required]
		#endregion ProfiePhoto Annotations

        public string ProfiePhoto { get; set; }

		#region UserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion UserId Annotations

        public int UserId { get; set; }

		#region UserDetails Annotations

        [InverseProperty("ProfilePhoto")]
		#endregion UserDetails Annotations

        public virtual ICollection<UserDetail> UserDetails { get; set; }


        public ProfilePhoto()
        {
			UserDetails = new HashSet<UserDetail>();
        }
	}
}