USE [master]
GO
/****** Object:  Database [FacebookDb]    Script Date: 21-02-2020 19:47:00 ******/
CREATE DATABASE [FacebookDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FacebookDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\FacebookDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FacebookDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\FacebookDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FacebookDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FacebookDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FacebookDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FacebookDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FacebookDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FacebookDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FacebookDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FacebookDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FacebookDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FacebookDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FacebookDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FacebookDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FacebookDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FacebookDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FacebookDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FacebookDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FacebookDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FacebookDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FacebookDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FacebookDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FacebookDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FacebookDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FacebookDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FacebookDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FacebookDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FacebookDb] SET  MULTI_USER 
GO
ALTER DATABASE [FacebookDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FacebookDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FacebookDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FacebookDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FacebookDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FacebookDb] SET QUERY_STORE = OFF
GO
USE [FacebookDb]
GO
/****** Object:  Schema [core]    Script Date: 21-02-2020 19:47:00 ******/
CREATE SCHEMA [core]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Media] [varchar](max) NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
	[MediaTypeAO] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostCaptions]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCaptions](
	[PostCaptionId] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [varchar](max) NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_PostCaptions] PRIMARY KEY CLUSTERED 
(
	[PostCaptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostMessages]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostMessages](
	[PostMessageId] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[PostDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_PostMessages] PRIMARY KEY CLUSTERED 
(
	[PostMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacebookUsers]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacebookUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[MobileNo] [bigint] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[GenderAO] [int] NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vTempPst]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vTempPst] as
select media,caption, message from FacebookUsers,Posts,PostCaptions ,PostMessages
where (Posts.PostId=Postcaptions.PostId and Posts.userid=FacebookUsers.UserID) or Posts.userid=FacebookUsers.UserID
and Postmessages.userid=facebookusers.userid;
GO
/****** Object:  Table [dbo].[ApplicationObject]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObject](
	[ApplicationObjectId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeId] [int] NOT NULL,
	[ApplicationObjectName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ApplicationObject] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationObjectType]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObjectType](
	[ApplicationObjectITypeId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ApplicationObjectType] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectITypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatMedia]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMedia](
	[MediaId] [int] IDENTITY(1,1) NOT NULL,
	[Media] [varchar](max) NOT NULL,
	[MediaTypeAO] [int] NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiverId] [int] NOT NULL,
	[SendDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_ChatMedia] PRIMARY KEY CLUSTERED 
(
	[MediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatMessages]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessages](
	[ChatMessageId] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiverId] [int] NOT NULL,
	[SendDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_ChatMessages] PRIMARY KEY CLUSTERED 
(
	[ChatMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoverPhotos]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoverPhotos](
	[CoverPhotoId] [int] IDENTITY(1,1) NOT NULL,
	[CoverPhoto] [varchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_CoverPhotos] PRIMARY KEY CLUSTERED 
(
	[CoverPhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationDetails]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationDetails](
	[EducationId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](100) NOT NULL,
	[CollegeSchoolName] [varchar](200) NULL,
	[UniversityBoardName] [varchar](200) NULL,
	[City] [varchar](50) NULL,
	[SchoolCollegeAO] [int] NOT NULL,
	[CourseStartDate] [date] NOT NULL,
	[CourseEndDate] [date] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_EducationDetails] PRIMARY KEY CLUSTERED 
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogActivities]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogActivities](
	[LogActivityId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_LogActivities] PRIMARY KEY CLUSTERED 
(
	[LogActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostComments]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostComments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_PostComments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostLikes]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostLikes](
	[LikeId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_PostLikes] PRIMARY KEY CLUSTERED 
(
	[LikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostShares]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostShares](
	[ShareId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_PostShares] PRIMARY KEY CLUSTERED 
(
	[ShareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfilePhotos]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfilePhotos](
	[ProfilePhotoId] [int] IDENTITY(1,1) NOT NULL,
	[ProfiePhoto] [varchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Profiles] PRIMARY KEY CLUSTERED 
(
	[ProfilePhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserDetailId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CurrentCity] [varchar](30) NULL,
	[HomeTown] [varchar](50) NULL,
	[RelationshipAO] [int] NULL,
	[Bio] [varchar](max) NULL,
	[ProfilePhotoId] [int] NULL,
	[CoverPhotoId] [int] NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWorks]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWorks](
	[UserWorkId] [int] IDENTITY(1,1) NOT NULL,
	[WorkName] [varchar](100) NOT NULL,
	[WorkDescription] [varchar](max) NULL,
	[UserId] [int] NOT NULL,
	[WorkStartDate] [date] NULL,
	[WorkEndDate] [date] NULL,
 CONSTRAINT [PK_UserWorks] PRIMARY KEY CLUSTERED 
(
	[UserWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicationObject]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationObject_ApplicationObject] FOREIGN KEY([ApplicationObjectTypeId])
REFERENCES [dbo].[ApplicationObjectType] ([ApplicationObjectITypeId])
GO
ALTER TABLE [dbo].[ApplicationObject] CHECK CONSTRAINT [FK_ApplicationObject_ApplicationObject]
GO
ALTER TABLE [dbo].[ChatMedia]  WITH CHECK ADD  CONSTRAINT [FK_Media_Receiver] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[ChatMedia] CHECK CONSTRAINT [FK_Media_Receiver]
GO
ALTER TABLE [dbo].[ChatMedia]  WITH CHECK ADD  CONSTRAINT [FK_Media_Sender] FOREIGN KEY([SenderId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[ChatMedia] CHECK CONSTRAINT [FK_Media_Sender]
GO
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD  CONSTRAINT [FK_Receiver] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[ChatMessages] CHECK CONSTRAINT [FK_Receiver]
GO
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD  CONSTRAINT [FK_Sender] FOREIGN KEY([SenderId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[ChatMessages] CHECK CONSTRAINT [FK_Sender]
GO
ALTER TABLE [dbo].[CoverPhotos]  WITH CHECK ADD  CONSTRAINT [FK_CoverPhotos_FacebookUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[CoverPhotos] CHECK CONSTRAINT [FK_CoverPhotos_FacebookUsers]
GO
ALTER TABLE [dbo].[FacebookUsers]  WITH CHECK ADD  CONSTRAINT [FK_FacebookUser_ApplicationObject] FOREIGN KEY([GenderAO])
REFERENCES [dbo].[ApplicationObject] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[FacebookUsers] CHECK CONSTRAINT [FK_FacebookUser_ApplicationObject]
GO
ALTER TABLE [dbo].[LogActivities]  WITH CHECK ADD  CONSTRAINT [FK_LogActivities_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[LogActivities] CHECK CONSTRAINT [FK_LogActivities_Users]
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD  CONSTRAINT [FK_PostComments_FacebookUsers] FOREIGN KEY([PostId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[PostComments] CHECK CONSTRAINT [FK_PostComments_FacebookUsers]
GO
ALTER TABLE [dbo].[PostLikes]  WITH CHECK ADD  CONSTRAINT [FK_PostLikes_PostLikes1] FOREIGN KEY([UserId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[PostLikes] CHECK CONSTRAINT [FK_PostLikes_PostLikes1]
GO
ALTER TABLE [dbo].[PostMessages]  WITH CHECK ADD  CONSTRAINT [FK_PostMessages_FacebookUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[PostMessages] CHECK CONSTRAINT [FK_PostMessages_FacebookUsers]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
ALTER TABLE [dbo].[PostShares]  WITH CHECK ADD  CONSTRAINT [FK_PostShares_FacebookUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[PostShares] CHECK CONSTRAINT [FK_PostShares_FacebookUsers]
GO
ALTER TABLE [dbo].[ProfilePhotos]  WITH CHECK ADD  CONSTRAINT [FK_ProfilePhotos_FacebookUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[ProfilePhotos] CHECK CONSTRAINT [FK_ProfilePhotos_FacebookUsers]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_ApplicationObject] FOREIGN KEY([RelationshipAO])
REFERENCES [dbo].[ApplicationObject] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_ApplicationObject]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_CoverPhotos] FOREIGN KEY([CoverPhotoId])
REFERENCES [dbo].[CoverPhotos] ([CoverPhotoId])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_CoverPhotos]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_EducationDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_EducationDetails]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_ProfilePhotos] FOREIGN KEY([ProfilePhotoId])
REFERENCES [dbo].[ProfilePhotos] ([ProfilePhotoId])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_ProfilePhotos]
GO
ALTER TABLE [dbo].[UserWorks]  WITH CHECK ADD  CONSTRAINT [FK_UserWorks_FacebookUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[FacebookUsers] ([UserID])
GO
ALTER TABLE [dbo].[UserWorks] CHECK CONSTRAINT [FK_UserWorks_FacebookUsers]
GO
/****** Object:  StoredProcedure [dbo].[spChatListUsers]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[spChatListUsers] @id int as
select Distinct Firstname as Name   from FacebookUsers,ChatMessages where senderId=@id and ReceiverId=UserID Union 
select Distinct firstName  from ChatMessages,facebookUsers where receiverId=@id and senderId=UserID;
GO
/****** Object:  StoredProcedure [dbo].[spOneToOneChats]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spOneToOneChats] @sender int,@receiver int as
(select Firstname as Sender,Media,Chatmedia.SendDateTime  from ChatMedia,FacebookUsers 
where ((ChatMedia.senderId=@receiver and ChatMedia.receiverId=@sender) or (ChatMedia.SenderId=@sender and ChatMedia.ReceiverId=@receiver)) 
and ChatMedia.SenderId=userid) UNION
(select Firstname as Sender, Message,ChatMessages.SendDateTime  from ChatMessages,FacebookUsers 
where ((ChatMessages.senderId=@receiver and ChatMessages.receiverId=@sender) or (ChatMessages.senderId=@sender and ChatMessages.receiverId=@receiver)) 
and ChatMessages.SenderId=UserID) Order by SendDateTime;
GO
/****** Object:  StoredProcedure [dbo].[spProfileView]    Script Date: 21-02-2020 19:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spProfileView] @id int as 

select Currentcity,hometown,ApplicationObjectName as Relationship,bio,workname,WorkDescription,coursename,CollegeSchoolName,UniversityBoardName 
from FacebookUsers, UserDetails,UserWorks,EducationDetails,ApplicationObject
where UserDetailId=FacebookUsers.UserID
and UserWorks.UserId=FacebookUsers.UserID and EducationDetails.UserId=FacebookUsers.UserID and facebookusers.UserID=@id and 
ApplicationObjectid=RelationshipAO;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ApplicationObject Image=3,Video=4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChatMedia', @level2type=N'COLUMN',@level2name=N'MediaTypeAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ApplicationObject School=1,College=2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EducationDetails', @level2type=N'COLUMN',@level2name=N'SchoolCollegeAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ApplicationObjet Male=5,Female=6,Other=7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacebookUsers', @level2type=N'COLUMN',@level2name=N'GenderAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ApplicationObject Image=3,Video=4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Posts', @level2type=N'COLUMN',@level2name=N'MediaTypeAO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ApplicationObject Single=8,Married=9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserDetails', @level2type=N'COLUMN',@level2name=N'RelationshipAO'
GO
USE [master]
GO
ALTER DATABASE [FacebookDb] SET  READ_WRITE 
GO
