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
    [Table("UserDetails",Schema="dbo")]
    public partial class UserDetail
    {
		#region UserDetailId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion UserDetailId Annotations

        public int UserDetailId { get; set; }

		#region UserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
		#endregion UserId Annotations

        public int UserId { get; set; }

		#region CurrentCity Annotations

        [MaxLength(30)]
		#endregion CurrentCity Annotations

        public string CurrentCity { get; set; }

		#region HomeTown Annotations

        [MaxLength(50)]
		#endregion HomeTown Annotations

        public string HomeTown { get; set; }

		#region RelationshipAO Annotations

        [RelationshipTableAttribue("ApplicationObject","dbo","","RelationshipAO")]
		#endregion RelationshipAO Annotations

        public Nullable<int> RelationshipAO { get; set; }


        public string Bio { get; set; }

		#region ProfilePhotoId Annotations

        [RelationshipTableAttribue("ProfilePhotos","dbo","","ProfilePhotoId")]
		#endregion ProfilePhotoId Annotations

        public Nullable<int> ProfilePhotoId { get; set; }

		#region CoverPhotoId Annotations

        [RelationshipTableAttribue("CoverPhotos","dbo","","CoverPhotoId")]
		#endregion CoverPhotoId Annotations

        public Nullable<int> CoverPhotoId { get; set; }

		#region ApplicationObject Annotations

        [ForeignKey(nameof(RelationshipAO))]
        [InverseProperty(nameof(FacebookProjectRxWeb.Models.Main.ApplicationObject.UserDetails))]
		#endregion ApplicationObject Annotations

        public virtual ApplicationObject ApplicationObject { get; set; }

		#region CoverPhoto Annotations

        [ForeignKey(nameof(CoverPhotoId))]
        [InverseProperty(nameof(FacebookProjectRxWeb.Models.Main.CoverPhoto.UserDetails))]
		#endregion CoverPhoto Annotations

        public virtual CoverPhoto CoverPhoto { get; set; }

		#region ProfilePhoto Annotations

        [ForeignKey(nameof(ProfilePhotoId))]
        [InverseProperty(nameof(FacebookProjectRxWeb.Models.Main.ProfilePhoto.UserDetails))]
		#endregion ProfilePhoto Annotations

        public virtual ProfilePhoto ProfilePhoto { get; set; }


        public UserDetail()
        {
        }
	}
}