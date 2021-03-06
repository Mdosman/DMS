SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Creating schemata'
GO
PRINT N'Creating [dbo].[tblOrganizationAddresses]'
GO
CREATE TABLE [dbo].[tblOrganizationAddresses]
(
[OrganizationAddressId] [int] NOT NULL IDENTITY(1, 1),
[OrganizationId] [int] NOT NULL,
[AddressId] [int] NOT NULL,
[AddressTypeId] [smallint] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_OrganizationAddresses_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblOrganizationAddresses_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblOrganizationAddresses_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_OrganizationAddresses] on [dbo].[tblOrganizationAddresses]'
GO
ALTER TABLE [dbo].[tblOrganizationAddresses] ADD CONSTRAINT [PK_OrganizationAddresses] PRIMARY KEY CLUSTERED  ([OrganizationAddressId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblContactInfos]'
GO
CREATE TABLE [dbo].[tblContactInfos]
(
[ContactInfoId] [int] NOT NULL IDENTITY(1, 1),
[EmailAddress] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WirelessPhone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_tblContactInfos_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblContactInfos_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblContactInfos_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_ContactInfos] on [dbo].[tblContactInfos]'
GO
ALTER TABLE [dbo].[tblContactInfos] ADD CONSTRAINT [PK_ContactInfos] PRIMARY KEY CLUSTERED  ([ContactInfoId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblDonorContactInfos]'
GO
CREATE TABLE [dbo].[tblDonorContactInfos]
(
[DonorContactInfoId] [int] NOT NULL IDENTITY(1, 1),
[DonorId] [int] NOT NULL,
[ContactInfoId] [int] NOT NULL,
[ContactInfoTypeId] [smallint] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_DonorContactInfos_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblDonorContactInfos_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblDonorContactInfos_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DonorContactInfos] on [dbo].[tblDonorContactInfos]'
GO
ALTER TABLE [dbo].[tblDonorContactInfos] ADD CONSTRAINT [PK_DonorContactInfos] PRIMARY KEY CLUSTERED  ([DonorContactInfoId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblAddressTypes]'
GO
CREATE TABLE [dbo].[tblAddressTypes]
(
[AddressTypeId] [smallint] NOT NULL IDENTITY(1, 1),
[AddressType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_tblAddressTypes_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_AddressType_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_AddressType_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_AddressType] on [dbo].[tblAddressTypes]'
GO
ALTER TABLE [dbo].[tblAddressTypes] ADD CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED  ([AddressTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblOrganizationContactInfos]'
GO
CREATE TABLE [dbo].[tblOrganizationContactInfos]
(
[OrganizationContactInfoId] [int] NOT NULL IDENTITY(1, 1),
[OrganizationId] [int] NOT NULL,
[ContactInfoId] [int] NOT NULL,
[ContactInfoTypeId] [smallint] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_OrganizationContactInfos_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblOrganizationContactInfos_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblOrganizationContactInfos_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_OrganizationContactInfos] on [dbo].[tblOrganizationContactInfos]'
GO
ALTER TABLE [dbo].[tblOrganizationContactInfos] ADD CONSTRAINT [PK_OrganizationContactInfos] PRIMARY KEY CLUSTERED  ([OrganizationContactInfoId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblContactInfoTypes]'
GO
CREATE TABLE [dbo].[tblContactInfoTypes]
(
[ContactInfoTypeId] [smallint] NOT NULL IDENTITY(1, 1),
[ContactInfoType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_tblContactInfoTypes_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_ContactInfoType_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_ContactInfoType_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_ContactInfoType] on [dbo].[tblContactInfoTypes]'
GO
ALTER TABLE [dbo].[tblContactInfoTypes] ADD CONSTRAINT [PK_ContactInfoType] PRIMARY KEY CLUSTERED  ([ContactInfoTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblPaymentTypes]'
GO
CREATE TABLE [dbo].[tblPaymentTypes]
(
[PaymentTypeId] [smallint] NOT NULL IDENTITY(1, 1),
[PaymentType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_tblPaymentTypes_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblPaymentTypes_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblPaymentTypes_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_PaymentType] on [dbo].[tblPaymentTypes]'
GO
ALTER TABLE [dbo].[tblPaymentTypes] ADD CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED  ([PaymentTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblDonorGroupTypes]'
GO
CREATE TABLE [dbo].[tblDonorGroupTypes]
(
[DonorGroupTypeId] [smallint] NOT NULL IDENTITY(1, 1),
[DonorGroupType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_tblDonorGroupTypes_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblDonorGroupTypes_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblDonorGroupTypes_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DonorGroupType] on [dbo].[tblDonorGroupTypes]'
GO
ALTER TABLE [dbo].[tblDonorGroupTypes] ADD CONSTRAINT [PK_DonorGroupType] PRIMARY KEY CLUSTERED  ([DonorGroupTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblDonorStatus]'
GO
CREATE TABLE [dbo].[tblDonorStatus]
(
[DonorStatusId] [tinyint] NOT NULL IDENTITY(1, 1),
[DonorStatus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_tblDonorStatus_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblDonorStatus_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblDonorStatus_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DonorStatus] on [dbo].[tblDonorStatus]'
GO
ALTER TABLE [dbo].[tblDonorStatus] ADD CONSTRAINT [PK_DonorStatus] PRIMARY KEY CLUSTERED  ([DonorStatusId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblContributionCategories]'
GO
CREATE TABLE [dbo].[tblContributionCategories]
(
[ContributionCategoryId] [int] NOT NULL IDENTITY(1, 1),
[ContributionCategory] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[OrganizationId] [int] NOT NULL,
[IsDefault] [bit] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_ContributionCategories_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_ContributionCategories_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_ContributionCategories_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_ContributionCategories] on [dbo].[tblContributionCategories]'
GO
ALTER TABLE [dbo].[tblContributionCategories] ADD CONSTRAINT [PK_ContributionCategories] PRIMARY KEY CLUSTERED  ([ContributionCategoryId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblDonorTypes]'
GO
CREATE TABLE [dbo].[tblDonorTypes]
(
[DonorTypeId] [tinyint] NOT NULL IDENTITY(1, 1),
[DonorType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_tblDonorTypes_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblDonorTypes_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblDonorTypes_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DonorType] on [dbo].[tblDonorTypes]'
GO
ALTER TABLE [dbo].[tblDonorTypes] ADD CONSTRAINT [PK_DonorType] PRIMARY KEY CLUSTERED  ([DonorTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblDonors]'
GO
CREATE TABLE [dbo].[tblDonors]
(
[DonorId] [int] NOT NULL IDENTITY(1, 1),
[Description] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MiddleName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GenderId] [tinyint] NULL,
[MaritalStatusId] [tinyint] NULL,
[Note] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DonorTypeId] [tinyint] NOT NULL,
[DonorStatusId] [tinyint] NOT NULL,
[OrganizationId] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_tblDonors_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_Donors_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_Donors_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_Donors] on [dbo].[tblDonors]'
GO
ALTER TABLE [dbo].[tblDonors] ADD CONSTRAINT [PK_Donors] PRIMARY KEY CLUSTERED  ([DonorId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblCountries]'
GO
CREATE TABLE [dbo].[tblCountries]
(
[CountryId] [int] NOT NULL IDENTITY(1, 1),
[Country] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ISO2] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ISO3] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Countries_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_Countries_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_Countries_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_Countries] on [dbo].[tblCountries]'
GO
ALTER TABLE [dbo].[tblCountries] ADD CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED  ([CountryId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblDonorGroups]'
GO
CREATE TABLE [dbo].[tblDonorGroups]
(
[DonorGroupId] [int] NOT NULL IDENTITY(1, 1),
[DonorId] [int] NOT NULL,
[DonorGroupTypeId] [smallint] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_DonorGroups_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_DonorGroups_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_DonorGroups_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DonorGroups] on [dbo].[tblDonorGroups]'
GO
ALTER TABLE [dbo].[tblDonorGroups] ADD CONSTRAINT [PK_DonorGroups] PRIMARY KEY CLUSTERED  ([DonorGroupId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblDonorAdresses]'
GO
CREATE TABLE [dbo].[tblDonorAdresses]
(
[DonorAddressId] [int] NOT NULL IDENTITY(1, 1),
[DonorId] [int] NOT NULL,
[AddressId] [int] NOT NULL,
[AddressTypeId] [smallint] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_DonorAdresses_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblDonorAdresses_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblDonorAdresses_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DonorAdresses] on [dbo].[tblDonorAdresses]'
GO
ALTER TABLE [dbo].[tblDonorAdresses] ADD CONSTRAINT [PK_DonorAdresses] PRIMARY KEY CLUSTERED  ([DonorAddressId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblContributions]'
GO
CREATE TABLE [dbo].[tblContributions]
(
[ContributionId] [int] NOT NULL IDENTITY(1, 1),
[BatchId] [int] NULL,
[DonorId] [int] NULL,
[ContributionCategoryId] [int] NOT NULL,
[ContributionDate] [datetime] NOT NULL,
[PaymentTypeId] [smallint] NOT NULL,
[Contribution] [money] NOT NULL,
[Note] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Custom1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Custom2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Contributions_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_Contributions_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_Contributions_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_Contributions] on [dbo].[tblContributions]'
GO
ALTER TABLE [dbo].[tblContributions] ADD CONSTRAINT [PK_Contributions] PRIMARY KEY CLUSTERED  ([ContributionId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblBatches]'
GO
CREATE TABLE [dbo].[tblBatches]
(
[BatchId] [int] NOT NULL IDENTITY(1, 1),
[BatchName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrganizationId] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Batches_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_Batches_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_Batches_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_Batches] on [dbo].[tblBatches]'
GO
ALTER TABLE [dbo].[tblBatches] ADD CONSTRAINT [PK_Batches] PRIMARY KEY CLUSTERED  ([BatchId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblOrganizations]'
GO
CREATE TABLE [dbo].[tblOrganizations]
(
[OrganizationId] [int] NOT NULL IDENTITY(1, 1),
[OrganizationName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Abbreviation] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FederalTaxId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Organization_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_Organization_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_Organization_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_Organization] on [dbo].[tblOrganizations]'
GO
ALTER TABLE [dbo].[tblOrganizations] ADD CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED  ([OrganizationId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblPledgeCampaigns]'
GO
CREATE TABLE [dbo].[tblPledgeCampaigns]
(
[PledgeCampaignId] [int] NOT NULL IDENTITY(1, 1),
[PledgeCampaignName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[ContributionCategoryId] [int] NOT NULL,
[TargetAmount] [money] NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_PledgeCampaigns_IsActive] DEFAULT ((1)),
[HasCompleted] [bit] NOT NULL,
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_PledgeCampaigns_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_PledgeCampaigns_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_PledgeCampaigns] on [dbo].[tblPledgeCampaigns]'
GO
ALTER TABLE [dbo].[tblPledgeCampaigns] ADD CONSTRAINT [PK_PledgeCampaigns] PRIMARY KEY CLUSTERED  ([PledgeCampaignId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblHouseholdMembers]'
GO
CREATE TABLE [dbo].[tblHouseholdMembers]
(
[HouseholdMemberId] [int] NOT NULL IDENTITY(1, 1),
[HouseholdId] [int] NOT NULL,
[DonorId] [int] NOT NULL,
[IsHouseholdHead] [bit] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_HouseholdMembers_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_HouseholdMembers_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_HouseholdMembers_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_HouseholdMembers] on [dbo].[tblHouseholdMembers]'
GO
ALTER TABLE [dbo].[tblHouseholdMembers] ADD CONSTRAINT [PK_HouseholdMembers] PRIMARY KEY CLUSTERED  ([HouseholdMemberId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblHouseholds]'
GO
CREATE TABLE [dbo].[tblHouseholds]
(
[HouseholdId] [int] NOT NULL IDENTITY(1, 1),
[HouseholdName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HouseholdPhone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressId] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_tblHouseholds_IsActive] DEFAULT ((1)),
[OrganizationId] [int] NOT NULL,
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblHouseholds_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblHouseholds_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_Households] on [dbo].[tblHouseholds]'
GO
ALTER TABLE [dbo].[tblHouseholds] ADD CONSTRAINT [PK_Households] PRIMARY KEY CLUSTERED  ([HouseholdId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblStateProvinces]'
GO
CREATE TABLE [dbo].[tblStateProvinces]
(
[StateProvinceId] [int] NOT NULL IDENTITY(1, 1),
[StateProvinceName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StateProvicenCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountryId] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_StateProvinces_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_StateProvinces_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_StateProvinces_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_StateProvinces] on [dbo].[tblStateProvinces]'
GO
ALTER TABLE [dbo].[tblStateProvinces] ADD CONSTRAINT [PK_StateProvinces] PRIMARY KEY CLUSTERED  ([StateProvinceId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblAddresses]'
GO
CREATE TABLE [dbo].[tblAddresses]
(
[AddressId] [int] NOT NULL IDENTITY(1, 1),
[AddressLine1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StateProvinceId] [int] NULL,
[PostalCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_tblAddresses_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblAddresses_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_tblAddresses_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_Address] on [dbo].[tblAddresses]'
GO
ALTER TABLE [dbo].[tblAddresses] ADD CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED  ([AddressId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[tblPledges]'
GO
CREATE TABLE [dbo].[tblPledges]
(
[PledgeId] [int] NOT NULL IDENTITY(1, 1),
[PledgeCampaignId] [int] NOT NULL,
[DonorId] [int] NOT NULL,
[PledgeAmount] [money] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Pledges_IsActive] DEFAULT ((1)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_Pledges_CreatedOn] DEFAULT (getdate()),
[CreatedBy] [int] NOT NULL,
[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_Pledges_UpdatedOn] DEFAULT (getdate()),
[UpdatedBy] [int] NOT NULL,
[Version] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_Pledges] on [dbo].[tblPledges]'
GO
ALTER TABLE [dbo].[tblPledges] ADD CONSTRAINT [PK_Pledges] PRIMARY KEY CLUSTERED  ([PledgeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblDonorAdresses]'
GO
ALTER TABLE [dbo].[tblDonorAdresses] ADD
CONSTRAINT [FK_DonorAdresses_Addresses] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[tblAddresses] ([AddressId]),
CONSTRAINT [FK_DonorAdresses_AddressTypes] FOREIGN KEY ([AddressTypeId]) REFERENCES [dbo].[tblAddressTypes] ([AddressTypeId]),
CONSTRAINT [FK_DonorAdresses_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblHouseholds]'
GO
ALTER TABLE [dbo].[tblHouseholds] ADD
CONSTRAINT [FK_Households_Addresses] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[tblAddresses] ([AddressId]),
CONSTRAINT [FK_Households_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblOrganizationAddresses]'
GO
ALTER TABLE [dbo].[tblOrganizationAddresses] ADD
CONSTRAINT [FK_OrganizationAddresses_Addresses] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[tblAddresses] ([AddressId]),
CONSTRAINT [FK_OrganizationAddresses_AddressTypes] FOREIGN KEY ([AddressTypeId]) REFERENCES [dbo].[tblAddressTypes] ([AddressTypeId]),
CONSTRAINT [FK_OrganizationAddresses_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblAddresses]'
GO
ALTER TABLE [dbo].[tblAddresses] ADD
CONSTRAINT [FK_Addresses_StateProvinces] FOREIGN KEY ([StateProvinceId]) REFERENCES [dbo].[tblStateProvinces] ([StateProvinceId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblContributions]'
GO
ALTER TABLE [dbo].[tblContributions] ADD
CONSTRAINT [FK_Contributions_Batches] FOREIGN KEY ([BatchId]) REFERENCES [dbo].[tblBatches] ([BatchId]),
CONSTRAINT [FK_Contributions_ContributionCategories] FOREIGN KEY ([ContributionCategoryId]) REFERENCES [dbo].[tblContributionCategories] ([ContributionCategoryId]),
CONSTRAINT [FK_Contributions_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId]),
CONSTRAINT [FK_Contributions_PaymentTypes] FOREIGN KEY ([PaymentTypeId]) REFERENCES [dbo].[tblPaymentTypes] ([PaymentTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblBatches]'
GO
ALTER TABLE [dbo].[tblBatches] ADD
CONSTRAINT [FK_Batches_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblDonorContactInfos]'
GO
ALTER TABLE [dbo].[tblDonorContactInfos] ADD
CONSTRAINT [FK_DonorContactInfos_ContactInfos] FOREIGN KEY ([ContactInfoId]) REFERENCES [dbo].[tblContactInfos] ([ContactInfoId]),
CONSTRAINT [FK_DonorContactInfos_ContactInfoTypes] FOREIGN KEY ([ContactInfoTypeId]) REFERENCES [dbo].[tblContactInfoTypes] ([ContactInfoTypeId]),
CONSTRAINT [FK_DonorContactInfos_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblOrganizationContactInfos]'
GO
ALTER TABLE [dbo].[tblOrganizationContactInfos] ADD
CONSTRAINT [FK_OrganizationContactInfos_ContactInfos] FOREIGN KEY ([ContactInfoId]) REFERENCES [dbo].[tblContactInfos] ([ContactInfoId]),
CONSTRAINT [FK_OrganizationContactInfos_ContactInfoTypes] FOREIGN KEY ([ContactInfoTypeId]) REFERENCES [dbo].[tblContactInfoTypes] ([ContactInfoTypeId]),
CONSTRAINT [FK_OrganizationContactInfos_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblPledgeCampaigns]'
GO
ALTER TABLE [dbo].[tblPledgeCampaigns] ADD
CONSTRAINT [FK_tblPledgeCampaigns_tblContributionCategories] FOREIGN KEY ([ContributionCategoryId]) REFERENCES [dbo].[tblContributionCategories] ([ContributionCategoryId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblContributionCategories]'
GO
ALTER TABLE [dbo].[tblContributionCategories] ADD
CONSTRAINT [FK_ContributionCategories_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblStateProvinces]'
GO
ALTER TABLE [dbo].[tblStateProvinces] ADD
CONSTRAINT [FK_StateProvinces_Countries] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[tblCountries] ([CountryId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblDonorGroups]'
GO
ALTER TABLE [dbo].[tblDonorGroups] ADD
CONSTRAINT [FK_DonorGroups_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId]),
CONSTRAINT [FK_DonorGroups_DonorGroupTypes] FOREIGN KEY ([DonorGroupTypeId]) REFERENCES [dbo].[tblDonorGroupTypes] ([DonorGroupTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblHouseholdMembers]'
GO
ALTER TABLE [dbo].[tblHouseholdMembers] ADD
CONSTRAINT [FK_HouseholdMembers_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId]),
CONSTRAINT [FK_HouseholdMembers_Households] FOREIGN KEY ([HouseholdId]) REFERENCES [dbo].[tblHouseholds] ([HouseholdId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblPledges]'
GO
ALTER TABLE [dbo].[tblPledges] ADD
CONSTRAINT [FK_Pledges_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId]),
CONSTRAINT [FK_Pledges_PledgeCampaigns] FOREIGN KEY ([PledgeCampaignId]) REFERENCES [dbo].[tblPledgeCampaigns] ([PledgeCampaignId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[tblDonors]'
GO
ALTER TABLE [dbo].[tblDonors] ADD
CONSTRAINT [FK_Donors_DonorTypes] FOREIGN KEY ([DonorTypeId]) REFERENCES [dbo].[tblDonorTypes] ([DonorTypeId]),
CONSTRAINT [FK_Donors_DonorStatus] FOREIGN KEY ([DonorStatusId]) REFERENCES [dbo].[tblDonorStatus] ([DonorStatusId]),
CONSTRAINT [FK_Donors_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)

-- Drop constraints from [dbo].[tblHouseholdMembers]
ALTER TABLE [dbo].[tblHouseholdMembers] DROP CONSTRAINT [FK_HouseholdMembers_Donors]
ALTER TABLE [dbo].[tblHouseholdMembers] DROP CONSTRAINT [FK_HouseholdMembers_Households]

-- Drop constraints from [dbo].[tblPledges]
ALTER TABLE [dbo].[tblPledges] DROP CONSTRAINT [FK_Pledges_Donors]
ALTER TABLE [dbo].[tblPledges] DROP CONSTRAINT [FK_Pledges_PledgeCampaigns]

-- Drop constraints from [dbo].[tblOrganizationAddresses]
ALTER TABLE [dbo].[tblOrganizationAddresses] DROP CONSTRAINT [FK_OrganizationAddresses_Addresses]
ALTER TABLE [dbo].[tblOrganizationAddresses] DROP CONSTRAINT [FK_OrganizationAddresses_AddressTypes]
ALTER TABLE [dbo].[tblOrganizationAddresses] DROP CONSTRAINT [FK_OrganizationAddresses_Organizations]

-- Drop constraints from [dbo].[tblHouseholds]
ALTER TABLE [dbo].[tblHouseholds] DROP CONSTRAINT [FK_Households_Addresses]
ALTER TABLE [dbo].[tblHouseholds] DROP CONSTRAINT [FK_Households_Organizations]

-- Drop constraints from [dbo].[tblDonorAdresses]
ALTER TABLE [dbo].[tblDonorAdresses] DROP CONSTRAINT [FK_DonorAdresses_Addresses]
ALTER TABLE [dbo].[tblDonorAdresses] DROP CONSTRAINT [FK_DonorAdresses_AddressTypes]
ALTER TABLE [dbo].[tblDonorAdresses] DROP CONSTRAINT [FK_DonorAdresses_Donors]

-- Drop constraints from [dbo].[tblPledgeCampaigns]
ALTER TABLE [dbo].[tblPledgeCampaigns] DROP CONSTRAINT [FK_tblPledgeCampaigns_tblContributionCategories]

-- Drop constraints from [dbo].[tblDonorGroups]
ALTER TABLE [dbo].[tblDonorGroups] DROP CONSTRAINT [FK_DonorGroups_DonorGroupTypes]
ALTER TABLE [dbo].[tblDonorGroups] DROP CONSTRAINT [FK_DonorGroups_Donors]

-- Drop constraints from [dbo].[tblDonorContactInfos]
ALTER TABLE [dbo].[tblDonorContactInfos] DROP CONSTRAINT [FK_DonorContactInfos_ContactInfos]
ALTER TABLE [dbo].[tblDonorContactInfos] DROP CONSTRAINT [FK_DonorContactInfos_ContactInfoTypes]
ALTER TABLE [dbo].[tblDonorContactInfos] DROP CONSTRAINT [FK_DonorContactInfos_Donors]

-- Drop constraints from [dbo].[tblContributions]
ALTER TABLE [dbo].[tblContributions] DROP CONSTRAINT [FK_Contributions_Batches]
ALTER TABLE [dbo].[tblContributions] DROP CONSTRAINT [FK_Contributions_ContributionCategories]
ALTER TABLE [dbo].[tblContributions] DROP CONSTRAINT [FK_Contributions_Donors]
ALTER TABLE [dbo].[tblContributions] DROP CONSTRAINT [FK_Contributions_PaymentTypes]

-- Drop constraints from [dbo].[tblAddresses]
ALTER TABLE [dbo].[tblAddresses] DROP CONSTRAINT [FK_Addresses_StateProvinces]

-- Drop constraints from [dbo].[tblStateProvinces]
ALTER TABLE [dbo].[tblStateProvinces] DROP CONSTRAINT [FK_StateProvinces_Countries]

-- Drop constraints from [dbo].[tblOrganizationContactInfos]
ALTER TABLE [dbo].[tblOrganizationContactInfos] DROP CONSTRAINT [FK_OrganizationContactInfos_ContactInfos]
ALTER TABLE [dbo].[tblOrganizationContactInfos] DROP CONSTRAINT [FK_OrganizationContactInfos_ContactInfoTypes]
ALTER TABLE [dbo].[tblOrganizationContactInfos] DROP CONSTRAINT [FK_OrganizationContactInfos_Organizations]

-- Drop constraints from [dbo].[tblDonors]
ALTER TABLE [dbo].[tblDonors] DROP CONSTRAINT [FK_Donors_DonorStatus]
ALTER TABLE [dbo].[tblDonors] DROP CONSTRAINT [FK_Donors_DonorTypes]
ALTER TABLE [dbo].[tblDonors] DROP CONSTRAINT [FK_Donors_Organizations]

-- Drop constraints from [dbo].[tblContributionCategories]
ALTER TABLE [dbo].[tblContributionCategories] DROP CONSTRAINT [FK_ContributionCategories_Organizations]

-- Drop constraints from [dbo].[tblBatches]
ALTER TABLE [dbo].[tblBatches] DROP CONSTRAINT [FK_Batches_Organizations]

-- Add 2 rows to [dbo].[tblAddressTypes]
SET IDENTITY_INSERT [dbo].[tblAddressTypes] ON
INSERT INTO [dbo].[tblAddressTypes] ([AddressTypeId], [AddressType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Business Address', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblAddressTypes] ([AddressTypeId], [AddressType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Home Address', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblAddressTypes] OFF

-- Add 3 rows to [dbo].[tblContactInfos]
SET IDENTITY_INSERT [dbo].[tblContactInfos] ON
INSERT INTO [dbo].[tblContactInfos] ([ContactInfoId], [EmailAddress], [Phone], [WirelessPhone], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'info@icntn.org', N'615-385-9379', N'615-385-9379', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblContactInfos] ([ContactInfoId], [EmailAddress], [Phone], [WirelessPhone], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'adeel.Md@gmail.com', N'6155551111', N'2223432222', 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
INSERT INTO [dbo].[tblContactInfos] ([ContactInfoId], [EmailAddress], [Phone], [WirelessPhone], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'md.osman@gmail.com', N'6155326600', N'7867771234', 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblContactInfos] OFF

-- Add 2 rows to [dbo].[tblContactInfoTypes]
SET IDENTITY_INSERT [dbo].[tblContactInfoTypes] ON
INSERT INTO [dbo].[tblContactInfoTypes] ([ContactInfoTypeId], [ContactInfoType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Business Contact', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblContactInfoTypes] ([ContactInfoTypeId], [ContactInfoType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Home Contact', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblContactInfoTypes] OFF

-- Add 250 rows to [dbo].[tblCountries]
SET IDENTITY_INSERT [dbo].[tblCountries] ON
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Afghanistan', N'AF        ', N'AFG       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Aland Islands', N'AX        ', N'ALA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'Albania', N'AL        ', N'ALB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'Algeria', N'DZ        ', N'DZA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'American Samoa', N'AS        ', N'ASM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, N'Andorra', N'AD        ', N'AND       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, N'Angola', N'AO        ', N'AGO       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (8, N'Anguilla', N'AI        ', N'AIA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (9, N'Antarctica', N'AQ        ', N'ATA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (10, N'Antigua and Barbuda', N'AG        ', N'ATG       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (11, N'Argentina', N'AR        ', N'ARG       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (12, N'Armenia', N'AM        ', N'ARM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (13, N'Aruba', N'AW        ', N'ABW       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (14, N'Australia', N'AU        ', N'AUS       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (15, N'Austria', N'AT        ', N'AUT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (16, N'Azerbaijan', N'AZ        ', N'AZE       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (17, N'Bahamas', N'BS        ', N'BHS       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (18, N'Bahrain', N'BH        ', N'BHR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (19, N'Bangladesh', N'BD        ', N'BGD       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (20, N'Barbados', N'BB        ', N'BRB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (21, N'Belarus', N'BY        ', N'BLR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (22, N'Belgium', N'BE        ', N'BEL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (23, N'Belize', N'BZ        ', N'BLZ       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (24, N'Benin', N'BJ        ', N'BEN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (25, N'Bermuda', N'BM        ', N'BMU       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (26, N'Bhutan', N'BT        ', N'BTN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (27, N'Bolivia', N'BO        ', N'BOL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (28, N'Bonaire, Sint Eustatius and Saba', N'BQ        ', N'BES       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (29, N'Bosnia and Herzegovina', N'BA        ', N'BIH       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (30, N'Botswana', N'BW        ', N'BWA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (31, N'Bouvet Island', N'BV        ', N'BVT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (32, N'Brazil', N'BR        ', N'BRA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (33, N'British Indian Ocean Territory', N'IO        ', N'IOT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (34, N'Brunei', N'BN        ', N'BRN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (35, N'Bulgaria', N'BG        ', N'BGR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (36, N'Burkina Faso', N'BF        ', N'BFA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (37, N'Burundi', N'BI        ', N'BDI       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (38, N'Cambodia', N'KH        ', N'KHM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (39, N'Cameroon', N'CM        ', N'CMR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (40, N'Canada', N'CA        ', N'CAN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (41, N'Cape Verde', N'CV        ', N'CPV       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (42, N'Cayman Islands', N'KY        ', N'CYM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (43, N'Central African Republic', N'CF        ', N'CAF       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (44, N'Chad', N'TD        ', N'TCD       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (45, N'Chile', N'CL        ', N'CHL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (46, N'China', N'CN        ', N'CHN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (47, N'Christmas Island', N'CX        ', N'CXR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (48, N'Cocos (Keeling) Islands', N'CC        ', N'CCK       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (49, N'Colombia', N'CO        ', N'COL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (50, N'Comoros', N'KM        ', N'COM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (51, N'Congo', N'CG        ', N'COG       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (52, N'Cook Islands', N'CK        ', N'COK       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (53, N'Costa Rica', N'CR        ', N'CRI       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (54, N'Cote d''ivoire (Ivory Coast)', N'CI        ', N'CIV       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (55, N'Croatia', N'HR        ', N'HRV       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (56, N'Cuba', N'CU        ', N'CUB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (57, N'Curacao', N'CW        ', N'CUW       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (58, N'Cyprus', N'CY        ', N'CYP       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (59, N'Czech Republic', N'CZ        ', N'CZE       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (60, N'Democratic Republic of the Congo', N'CD        ', N'COD       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (61, N'Denmark', N'DK        ', N'DNK       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (62, N'Djibouti', N'DJ        ', N'DJI       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (63, N'Dominica', N'DM        ', N'DMA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (64, N'Dominican Republic', N'DO        ', N'DOM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (65, N'Ecuador', N'EC        ', N'ECU       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (66, N'Egypt', N'EG        ', N'EGY       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (67, N'El Salvador', N'SV        ', N'SLV       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (68, N'Equatorial Guinea', N'GQ        ', N'GNQ       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (69, N'Eritrea', N'ER        ', N'ERI       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (70, N'Estonia', N'EE        ', N'EST       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (71, N'Ethiopia', N'ET        ', N'ETH       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (72, N'Falkland Islands (Malvinas)', N'FK        ', N'FLK       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (73, N'Faroe Islands', N'FO        ', N'FRO       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (74, N'Fiji', N'FJ        ', N'FJI       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (75, N'Finland', N'FI        ', N'FIN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (76, N'France', N'FR        ', N'FRA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (77, N'French Guiana', N'GF        ', N'GUF       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (78, N'French Polynesia', N'PF        ', N'PYF       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (79, N'French Southern Territories', N'TF        ', N'ATF       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (80, N'Gabon', N'GA        ', N'GAB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (81, N'Gambia', N'GM        ', N'GMB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (82, N'Georgia', N'GE        ', N'GEO       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (83, N'Germany', N'DE        ', N'DEU       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (84, N'Ghana', N'GH        ', N'GHA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (85, N'Gibraltar', N'GI        ', N'GIB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (86, N'Greece', N'GR        ', N'GRC       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (87, N'Greenland', N'GL        ', N'GRL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (88, N'Grenada', N'GD        ', N'GRD       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (89, N'Guadaloupe', N'GP        ', N'GLP       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (90, N'Guam', N'GU        ', N'GUM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (91, N'Guatemala', N'GT        ', N'GTM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (92, N'Guernsey', N'GG        ', N'GGY       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (93, N'Guinea', N'GN        ', N'GIN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (94, N'Guinea-Bissau', N'GW        ', N'GNB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (95, N'Guyana', N'GY        ', N'GUY       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (96, N'Haiti', N'HT        ', N'HTI       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (97, N'Heard Island and McDonald Islands', N'HM        ', N'HMD       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (98, N'Honduras', N'HN        ', N'HND       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (99, N'Hong Kong', N'HK        ', N'HKG       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (100, N'Hungary', N'HU        ', N'HUN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (101, N'Iceland', N'IS        ', N'ISL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (102, N'India', N'IN        ', N'IND       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (103, N'Indonesia', N'ID        ', N'IDN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (104, N'Iran', N'IR        ', N'IRN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (105, N'Iraq', N'IQ        ', N'IRQ       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (106, N'Ireland', N'IE        ', N'IRL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (107, N'Isle of Man', N'IM        ', N'IMN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (108, N'Israel', N'IL        ', N'ISR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (109, N'Italy', N'IT        ', N'ITA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (110, N'Jamaica', N'JM        ', N'JAM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (111, N'Japan', N'JP        ', N'JPN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (112, N'Jersey', N'JE        ', N'JEY       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (113, N'Jordan', N'JO        ', N'JOR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (114, N'Kazakhstan', N'KZ        ', N'KAZ       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (115, N'Kenya', N'KE        ', N'KEN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (116, N'Kiribati', N'KI        ', N'KIR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (117, N'Kosovo', N'XK        ', N'---       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (118, N'Kuwait', N'KW        ', N'KWT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (119, N'Kyrgyzstan', N'KG        ', N'KGZ       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (120, N'Laos', N'LA        ', N'LAO       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (121, N'Latvia', N'LV        ', N'LVA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (122, N'Lebanon', N'LB        ', N'LBN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (123, N'Lesotho', N'LS        ', N'LSO       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (124, N'Liberia', N'LR        ', N'LBR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (125, N'Libya', N'LY        ', N'LBY       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (126, N'Liechtenstein', N'LI        ', N'LIE       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (127, N'Lithuania', N'LT        ', N'LTU       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (128, N'Luxembourg', N'LU        ', N'LUX       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (129, N'Macao', N'MO        ', N'MAC       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (130, N'Macedonia', N'MK        ', N'MKD       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (131, N'Madagascar', N'MG        ', N'MDG       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (132, N'Malawi', N'MW        ', N'MWI       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (133, N'Malaysia', N'MY        ', N'MYS       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (134, N'Maldives', N'MV        ', N'MDV       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (135, N'Mali', N'ML        ', N'MLI       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (136, N'Malta', N'MT        ', N'MLT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (137, N'Marshall Islands', N'MH        ', N'MHL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (138, N'Martinique', N'MQ        ', N'MTQ       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (139, N'Mauritania', N'MR        ', N'MRT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (140, N'Mauritius', N'MU        ', N'MUS       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (141, N'Mayotte', N'YT        ', N'MYT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (142, N'Mexico', N'MX        ', N'MEX       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (143, N'Micronesia', N'FM        ', N'FSM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (144, N'Moldava', N'MD        ', N'MDA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (145, N'Monaco', N'MC        ', N'MCO       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (146, N'Mongolia', N'MN        ', N'MNG       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (147, N'Montenegro', N'ME        ', N'MNE       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (148, N'Montserrat', N'MS        ', N'MSR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (149, N'Morocco', N'MA        ', N'MAR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (150, N'Mozambique', N'MZ        ', N'MOZ       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (151, N'Myanmar (Burma)', N'MM        ', N'MMR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (152, N'Namibia', N'NA        ', N'NAM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (153, N'Nauru', N'NR        ', N'NRU       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (154, N'Nepal', N'NP        ', N'NPL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (155, N'Netherlands', N'NL        ', N'NLD       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (156, N'New Caledonia', N'NC        ', N'NCL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (157, N'New Zealand', N'NZ        ', N'NZL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (158, N'Nicaragua', N'NI        ', N'NIC       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (159, N'Niger', N'NE        ', N'NER       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (160, N'Nigeria', N'NG        ', N'NGA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (161, N'Niue', N'NU        ', N'NIU       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (162, N'Norfolk Island', N'NF        ', N'NFK       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (163, N'North Korea', N'KP        ', N'PRK       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (164, N'Northern Mariana Islands', N'MP        ', N'MNP       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (165, N'Norway', N'NO        ', N'NOR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (166, N'Oman', N'OM        ', N'OMN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (167, N'Pakistan', N'PK        ', N'PAK       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (168, N'Palau', N'PW        ', N'PLW       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (169, N'Palestine', N'PS        ', N'PSE       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (170, N'Panama', N'PA        ', N'PAN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (171, N'Papua New Guinea', N'PG        ', N'PNG       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (172, N'Paraguay', N'PY        ', N'PRY       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (173, N'Peru', N'PE        ', N'PER       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (174, N'Phillipines', N'PH        ', N'PHL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (175, N'Pitcairn', N'PN        ', N'PCN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (176, N'Poland', N'PL        ', N'POL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (177, N'Portugal', N'PT        ', N'PRT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (178, N'Puerto Rico', N'PR        ', N'PRI       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (179, N'Qatar', N'QA        ', N'QAT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (180, N'Reunion', N'RE        ', N'REU       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (181, N'Romania', N'RO        ', N'ROU       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (182, N'Russia', N'RU        ', N'RUS       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (183, N'Rwanda', N'RW        ', N'RWA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (184, N'Saint Barthelemy', N'BL        ', N'BLM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (185, N'Saint Helena', N'SH        ', N'SHN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (186, N'Saint Kitts and Nevis', N'KN        ', N'KNA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (187, N'Saint Lucia', N'LC        ', N'LCA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (188, N'Saint Martin', N'MF        ', N'MAF       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (189, N'Saint Pierre and Miquelon', N'PM        ', N'SPM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (190, N'Saint Vincent and the Grenadines', N'VC        ', N'VCT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (191, N'Samoa', N'WS        ', N'WSM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (192, N'San Marino', N'SM        ', N'SMR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (193, N'Sao Tome and Principe', N'ST        ', N'STP       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (194, N'Saudi Arabia', N'SA        ', N'SAU       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (195, N'Senegal', N'SN        ', N'SEN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (196, N'Serbia', N'RS        ', N'SRB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (197, N'Seychelles', N'SC        ', N'SYC       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (198, N'Sierra Leone', N'SL        ', N'SLE       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (199, N'Singapore', N'SG        ', N'SGP       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (200, N'Sint Maarten', N'SX        ', N'SXM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (201, N'Slovakia', N'SK        ', N'SVK       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (202, N'Slovenia', N'SI        ', N'SVN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (203, N'Solomon Islands', N'SB        ', N'SLB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (204, N'Somalia', N'SO        ', N'SOM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (205, N'South Africa', N'ZA        ', N'ZAF       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (206, N'South Georgia and the South Sandwich Islands', N'GS        ', N'SGS       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (207, N'South Korea', N'KR        ', N'KOR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (208, N'South Sudan', N'SS        ', N'SSD       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (209, N'Spain', N'ES        ', N'ESP       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (210, N'Sri Lanka', N'LK        ', N'LKA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (211, N'Sudan', N'SD        ', N'SDN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (212, N'Suriname', N'SR        ', N'SUR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (213, N'Svalbard and Jan Mayen', N'SJ        ', N'SJM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (214, N'Swaziland', N'SZ        ', N'SWZ       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (215, N'Sweden', N'SE        ', N'SWE       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (216, N'Switzerland', N'CH        ', N'CHE       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (217, N'Syria', N'SY        ', N'SYR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (218, N'Taiwan', N'TW        ', N'TWN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (219, N'Tajikistan', N'TJ        ', N'TJK       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (220, N'Tanzania', N'TZ        ', N'TZA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (221, N'Thailand', N'TH        ', N'THA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (222, N'Timor-Leste (East Timor)', N'TL        ', N'TLS       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (223, N'Togo', N'TG        ', N'TGO       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (224, N'Tokelau', N'TK        ', N'TKL       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (225, N'Tonga', N'TO        ', N'TON       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (226, N'Trinidad and Tobago', N'TT        ', N'TTO       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (227, N'Tunisia', N'TN        ', N'TUN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (228, N'Turkey', N'TR        ', N'TUR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (229, N'Turkmenistan', N'TM        ', N'TKM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (230, N'Turks and Caicos Islands', N'TC        ', N'TCA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (231, N'Tuvalu', N'TV        ', N'TUV       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (232, N'Uganda', N'UG        ', N'UGA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (233, N'Ukraine', N'UA        ', N'UKR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (234, N'United Arab Emirates', N'AE        ', N'ARE       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (235, N'United Kingdom', N'GB        ', N'GBR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (236, N'United States', N'US        ', N'USA       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (237, N'United States Minor Outlying Islands', N'UM        ', N'UMI       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (238, N'Uruguay', N'UY        ', N'URY       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (239, N'Uzbekistan', N'UZ        ', N'UZB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (240, N'Vanuatu', N'VU        ', N'VUT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (241, N'Vatican City', N'VA        ', N'VAT       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (242, N'Venezuela', N'VE        ', N'VEN       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (243, N'Vietnam', N'VN        ', N'VNM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (244, N'Virgin Islands, British', N'VG        ', N'VGB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (245, N'Virgin Islands, US', N'VI        ', N'VIR       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (246, N'Wallis and Futuna', N'WF        ', N'WLF       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (247, N'Western Sahara', N'EH        ', N'ESH       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (248, N'Yemen', N'YE        ', N'YEM       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (249, N'Zambia', N'ZM        ', N'ZMB       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
INSERT INTO [dbo].[tblCountries] ([CountryId], [Country], [ISO2], [ISO3], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (250, N'Zimbabwe', N'ZW        ', N'ZWE       ', 1, '2013-10-10T12:13:54.030', 1, '2013-10-10T12:13:54.030', 1)
SET IDENTITY_INSERT [dbo].[tblCountries] OFF

-- Add 5 rows to [dbo].[tblDonorGroupTypes]
SET IDENTITY_INSERT [dbo].[tblDonorGroupTypes] ON
INSERT INTO [dbo].[tblDonorGroupTypes] ([DonorGroupTypeId], [DonorGroupType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Sponsor', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorGroupTypes] ([DonorGroupTypeId], [DonorGroupType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Volunteer', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorGroupTypes] ([DonorGroupTypeId], [DonorGroupType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'Member', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorGroupTypes] ([DonorGroupTypeId], [DonorGroupType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'Board Member', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorGroupTypes] ([DonorGroupTypeId], [DonorGroupType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'Guest', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblDonorGroupTypes] OFF

-- Add 5 rows to [dbo].[tblDonorStatus]
SET IDENTITY_INSERT [dbo].[tblDonorStatus] ON
INSERT INTO [dbo].[tblDonorStatus] ([DonorStatusId], [DonorStatus], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Active Donor', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorStatus] ([DonorStatusId], [DonorStatus], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Pledging Donor', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorStatus] ([DonorStatusId], [DonorStatus], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'Inactive Donor', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorStatus] ([DonorStatusId], [DonorStatus], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'Deceased Donor', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorStatus] ([DonorStatusId], [DonorStatus], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'Prospective Donor', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblDonorStatus] OFF

-- Add 7 rows to [dbo].[tblDonorTypes]
SET IDENTITY_INSERT [dbo].[tblDonorTypes] ON
INSERT INTO [dbo].[tblDonorTypes] ([DonorTypeId], [DonorType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Individual/Household', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorTypes] ([DonorTypeId], [DonorType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Business/Corporation', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorTypes] ([DonorTypeId], [DonorType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'Foundation', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorTypes] ([DonorTypeId], [DonorType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'Government Agency', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorTypes] ([DonorTypeId], [DonorType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'Community Groups', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorTypes] ([DonorTypeId], [DonorType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, N'Educational Institutions', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorTypes] ([DonorTypeId], [DonorType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, N'Religion-Related', 1, '2013-10-07T00:00:00.000', 1, '2013-10-07T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblDonorTypes] OFF

-- Add 1 row to [dbo].[tblOrganizations]
SET IDENTITY_INSERT [dbo].[tblOrganizations] ON
INSERT INTO [dbo].[tblOrganizations] ([OrganizationId], [OrganizationName], [Abbreviation], [FederalTaxId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Islamic Center of Nashville', N'ICN', N'123456', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblOrganizations] OFF

-- Add 8 rows to [dbo].[tblPaymentTypes]
SET IDENTITY_INSERT [dbo].[tblPaymentTypes] ON
INSERT INTO [dbo].[tblPaymentTypes] ([PaymentTypeId], [PaymentType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Check', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblPaymentTypes] ([PaymentTypeId], [PaymentType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Cash', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblPaymentTypes] ([PaymentTypeId], [PaymentType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'Bank Transfer', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblPaymentTypes] ([PaymentTypeId], [PaymentType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'Online Payment', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblPaymentTypes] ([PaymentTypeId], [PaymentType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'Credit Card', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblPaymentTypes] ([PaymentTypeId], [PaymentType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, N'Debit', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblPaymentTypes] ([PaymentTypeId], [PaymentType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, N'Other', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblPaymentTypes] ([PaymentTypeId], [PaymentType], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (8, N'Unknown', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblPaymentTypes] OFF

-- Add 1 row to [dbo].[tblBatches]
SET IDENTITY_INSERT [dbo].[tblBatches] ON
INSERT INTO [dbo].[tblBatches] ([BatchId], [BatchName], [OrganizationId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Batch 1 ', 1, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblBatches] OFF

-- Add 7 rows to [dbo].[tblContributionCategories]
SET IDENTITY_INSERT [dbo].[tblContributionCategories] ON
INSERT INTO [dbo].[tblContributionCategories] ([ContributionCategoryId], [ContributionCategory], [OrganizationId], [IsDefault], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Donations', 1, 1, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblContributionCategories] ([ContributionCategoryId], [ContributionCategory], [OrganizationId], [IsDefault], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Building Fund', 1, 0, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblContributionCategories] ([ContributionCategoryId], [ContributionCategory], [OrganizationId], [IsDefault], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'General Fund', 1, 0, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblContributionCategories] ([ContributionCategoryId], [ContributionCategory], [OrganizationId], [IsDefault], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'Main Giving Fund', 1, 0, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblContributionCategories] ([ContributionCategoryId], [ContributionCategory], [OrganizationId], [IsDefault], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'Maintenance / Building', 1, 0, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblContributionCategories] ([ContributionCategoryId], [ContributionCategory], [OrganizationId], [IsDefault], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, N'Youth Sports Complex', 1, 0, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblContributionCategories] ([ContributionCategoryId], [ContributionCategory], [OrganizationId], [IsDefault], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, N'Burial Fund', 1, 0, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblContributionCategories] OFF

-- Add 2 rows to [dbo].[tblDonors]
SET IDENTITY_INSERT [dbo].[tblDonors] ON
INSERT INTO [dbo].[tblDonors] ([DonorId], [Description], [FirstName], [MiddleName], [LastName], [GenderId], [MaritalStatusId], [Note], [DonorTypeId], [DonorStatusId], [OrganizationId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Mohammed Osman', N'Mohammed', NULL, N'Osman', 1, 2, 'Note', 1, 1, 1, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonors] ([DonorId], [Description], [FirstName], [MiddleName], [LastName], [GenderId], [MaritalStatusId], [Note], [DonorTypeId], [DonorStatusId], [OrganizationId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Adeel Mohammed', N'Adeel', NULL, N'Mohammed', 1, 2, 'Test', 1, 1, 1, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblDonors] OFF

-- Add 1 row to [dbo].[tblOrganizationContactInfos]
SET IDENTITY_INSERT [dbo].[tblOrganizationContactInfos] ON
INSERT INTO [dbo].[tblOrganizationContactInfos] ([OrganizationContactInfoId], [OrganizationId], [ContactInfoId], [ContactInfoTypeId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, 1, 1, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblOrganizationContactInfos] OFF

-- Add 51 rows to [dbo].[tblStateProvinces]
SET IDENTITY_INSERT [dbo].[tblStateProvinces] ON
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Alaska', N'AK', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Alabama', N'AL', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'Arkansas', N'AR', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'Arizona', N'AZ', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'California', N'CA', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, N'Colorado', N'CO', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, N'Connecticut', N'CT', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (8, N'District of Columbia', N'DC', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (9, N'Delaware', N'DE', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (10, N'Florida', N'FL', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (11, N'Georgia', N'GA', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (12, N'Hawaii', N'HI', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (13, N'Iowa', N'IA', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (14, N'Idaho', N'ID', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (15, N'Illinois', N'IL', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (16, N'Indiana', N'IN', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (17, N'Kansas', N'KS', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (18, N'Kentucky', N'KY', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (19, N'Louisiana', N'LA', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (20, N'Massachusetts', N'MA', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (21, N'Maryland', N'MD', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (22, N'Maine', N'ME', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (23, N'Michigan', N'MI', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (24, N'Minnesota', N'MN', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (25, N'Missouri', N'MO', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (26, N'Mississippi', N'MS', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (27, N'Montana', N'MT', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (28, N'North Carolina', N'NC', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (29, N'North Dakota', N'ND', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (30, N'Nebraska', N'NE', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (31, N'New Hampshire', N'NH', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (32, N'New Jersey', N'NJ', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (33, N'New Mexico', N'NM', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (34, N'Nevada', N'NV', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (35, N'New York', N'NY', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (36, N'Ohio', N'OH', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (37, N'Oklahoma', N'OK', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (38, N'Oregon', N'OR', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (39, N'Pennsylvania', N'PA', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (40, N'Rhode Island', N'RI', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (41, N'South Carolina', N'SC', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (42, N'South Dakota', N'SD', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (43, N'Tennessee', N'TN', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (44, N'Texas', N'TX', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (45, N'Utah', N'UT', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (46, N'Virginia', N'VA', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (47, N'Vermont', N'VT', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (48, N'Washington', N'WA', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (49, N'Wisconsin', N'WI', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (50, N'West Virginia', N'WV', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
INSERT INTO [dbo].[tblStateProvinces] ([StateProvinceId], [StateProvinceName], [StateProvicenCode], [CountryId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (51, N'Wyoming', N'WY', 236, 1, '2013-10-10T12:22:35.477', 1, '2013-10-10T12:22:35.477', 1)
SET IDENTITY_INSERT [dbo].[tblStateProvinces] OFF

-- Add 3 rows to [dbo].[tblAddresses]
SET IDENTITY_INSERT [dbo].[tblAddresses] ON
INSERT INTO [dbo].[tblAddresses] ([AddressId], [AddressLine1], [AddressLine2], [City], [StateProvinceId], [PostalCode], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'2515 12th Ave S', NULL, N'Nashville', 43, N'37204', 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblAddresses] ([AddressId], [AddressLine1], [AddressLine2], [City], [StateProvinceId], [PostalCode], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Sweetbriar Av', NULL, N'Nashville', 43, N'37212', 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
INSERT INTO [dbo].[tblAddresses] ([AddressId], [AddressLine1], [AddressLine2], [City], [StateProvinceId], [PostalCode], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N' 533 Coventry Ct', NULL, N'Nashville', 43, N'37211', 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblAddresses] OFF

-- Add 2 rows to [dbo].[tblContributions]
SET IDENTITY_INSERT [dbo].[tblContributions] ON
INSERT INTO [dbo].[tblContributions] ([ContributionId], [BatchId], [DonorId], [ContributionCategoryId], [ContributionDate], [PaymentTypeId], [Contribution], [Note], [Custom1], [Custom2], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, 1, 1, '2013-10-14T00:00:00.000', 2, 200.0000, NULL, NULL, NULL, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
INSERT INTO [dbo].[tblContributions] ([ContributionId], [BatchId], [DonorId], [ContributionCategoryId], [ContributionDate], [PaymentTypeId], [Contribution], [Note], [Custom1], [Custom2], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 1, 2, 1, '2013-10-14T00:00:00.000', 2, 300.0000, NULL, NULL, NULL, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblContributions] OFF

-- Add 2 rows to [dbo].[tblDonorContactInfos]
SET IDENTITY_INSERT [dbo].[tblDonorContactInfos] ON
INSERT INTO [dbo].[tblDonorContactInfos] ([DonorContactInfoId], [DonorId], [ContactInfoId], [ContactInfoTypeId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, 3, 2, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorContactInfos] ([DonorContactInfoId], [DonorId], [ContactInfoId], [ContactInfoTypeId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 2, 2, 2, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblDonorContactInfos] OFF

-- Add 4 rows to [dbo].[tblDonorGroups]
SET IDENTITY_INSERT [dbo].[tblDonorGroups] ON
INSERT INTO [dbo].[tblDonorGroups] ([DonorGroupId], [DonorId], [DonorGroupTypeId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, 3, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorGroups] ([DonorGroupId], [DonorId], [DonorGroupTypeId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 1, 2, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorGroups] ([DonorGroupId], [DonorId], [DonorGroupTypeId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, 2, 1, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorGroups] ([DonorGroupId], [DonorId], [DonorGroupTypeId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, 2, 2, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblDonorGroups] OFF

-- Add 1 row to [dbo].[tblPledgeCampaigns]
SET IDENTITY_INSERT [dbo].[tblPledgeCampaigns] ON
INSERT INTO [dbo].[tblPledgeCampaigns] ([PledgeCampaignId], [PledgeCampaignName], [StartDate], [EndDate], [ContributionCategoryId], [TargetAmount], [IsActive], [HasCompleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Islamic school Building', '2013-01-01T00:00:00.000', '2014-01-01T00:00:00.000', 2, 500000.0000, 1, 0, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblPledgeCampaigns] OFF

-- Add 2 rows to [dbo].[tblDonorAdresses]
SET IDENTITY_INSERT [dbo].[tblDonorAdresses] ON
INSERT INTO [dbo].[tblDonorAdresses] ([DonorAddressId], [DonorId], [AddressId], [AddressTypeId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 2, 3, 2, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
INSERT INTO [dbo].[tblDonorAdresses] ([DonorAddressId], [DonorId], [AddressId], [AddressTypeId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 1, 2, 2, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblDonorAdresses] OFF

-- Add 2 rows to [dbo].[tblHouseholds]
SET IDENTITY_INSERT [dbo].[tblHouseholds] ON
INSERT INTO [dbo].[tblHouseholds] ([HouseholdId], [HouseholdName], [HouseholdPhone], [AddressId], [IsActive], [OrganizationId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Adeel', N'6155552366', 3, 1, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
INSERT INTO [dbo].[tblHouseholds] ([HouseholdId], [HouseholdName], [HouseholdPhone], [AddressId], [IsActive], [OrganizationId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Osman', N'6155326600', 2, 1, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblHouseholds] OFF

-- Add 1 row to [dbo].[tblOrganizationAddresses]
SET IDENTITY_INSERT [dbo].[tblOrganizationAddresses] ON
INSERT INTO [dbo].[tblOrganizationAddresses] ([OrganizationAddressId], [OrganizationId], [AddressId], [AddressTypeId], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, 1, 1, 1, '2013-10-10T00:00:00.000', 1, '2013-10-10T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblOrganizationAddresses] OFF

-- Add 2 rows to [dbo].[tblPledges]
SET IDENTITY_INSERT [dbo].[tblPledges] ON
INSERT INTO [dbo].[tblPledges] ([PledgeId], [PledgeCampaignId], [DonorId], [PledgeAmount], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, 2, 200.0000, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
INSERT INTO [dbo].[tblPledges] ([PledgeId], [PledgeCampaignId], [DonorId], [PledgeAmount], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 1, 1, 300.0000, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblPledges] OFF

-- Add 2 rows to [dbo].[tblHouseholdMembers]
SET IDENTITY_INSERT [dbo].[tblHouseholdMembers] ON
INSERT INTO [dbo].[tblHouseholdMembers] ([HouseholdMemberId], [HouseholdId], [DonorId], [IsHouseholdHead], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, 2, 1, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
INSERT INTO [dbo].[tblHouseholdMembers] ([HouseholdMemberId], [HouseholdId], [DonorId], [IsHouseholdHead], [IsActive], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 2, 1, 1, 1, '2013-10-14T00:00:00.000', 1, '2013-10-14T00:00:00.000', 1)
SET IDENTITY_INSERT [dbo].[tblHouseholdMembers] OFF

-- Add constraints to [dbo].[tblHouseholdMembers]
ALTER TABLE [dbo].[tblHouseholdMembers] ADD CONSTRAINT [FK_HouseholdMembers_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId])
ALTER TABLE [dbo].[tblHouseholdMembers] ADD CONSTRAINT [FK_HouseholdMembers_Households] FOREIGN KEY ([HouseholdId]) REFERENCES [dbo].[tblHouseholds] ([HouseholdId])

-- Add constraints to [dbo].[tblPledges]
ALTER TABLE [dbo].[tblPledges] ADD CONSTRAINT [FK_Pledges_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId])
ALTER TABLE [dbo].[tblPledges] ADD CONSTRAINT [FK_Pledges_PledgeCampaigns] FOREIGN KEY ([PledgeCampaignId]) REFERENCES [dbo].[tblPledgeCampaigns] ([PledgeCampaignId])

-- Add constraints to [dbo].[tblOrganizationAddresses]
ALTER TABLE [dbo].[tblOrganizationAddresses] ADD CONSTRAINT [FK_OrganizationAddresses_Addresses] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[tblAddresses] ([AddressId])
ALTER TABLE [dbo].[tblOrganizationAddresses] ADD CONSTRAINT [FK_OrganizationAddresses_AddressTypes] FOREIGN KEY ([AddressTypeId]) REFERENCES [dbo].[tblAddressTypes] ([AddressTypeId])
ALTER TABLE [dbo].[tblOrganizationAddresses] ADD CONSTRAINT [FK_OrganizationAddresses_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])

-- Add constraints to [dbo].[tblHouseholds]
ALTER TABLE [dbo].[tblHouseholds] ADD CONSTRAINT [FK_Households_Addresses] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[tblAddresses] ([AddressId])
ALTER TABLE [dbo].[tblHouseholds] ADD CONSTRAINT [FK_Households_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])

-- Add constraints to [dbo].[tblDonorAdresses]
ALTER TABLE [dbo].[tblDonorAdresses] ADD CONSTRAINT [FK_DonorAdresses_Addresses] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[tblAddresses] ([AddressId])
ALTER TABLE [dbo].[tblDonorAdresses] ADD CONSTRAINT [FK_DonorAdresses_AddressTypes] FOREIGN KEY ([AddressTypeId]) REFERENCES [dbo].[tblAddressTypes] ([AddressTypeId])
ALTER TABLE [dbo].[tblDonorAdresses] ADD CONSTRAINT [FK_DonorAdresses_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId])

-- Add constraints to [dbo].[tblPledgeCampaigns]
ALTER TABLE [dbo].[tblPledgeCampaigns] ADD CONSTRAINT [FK_tblPledgeCampaigns_tblContributionCategories] FOREIGN KEY ([ContributionCategoryId]) REFERENCES [dbo].[tblContributionCategories] ([ContributionCategoryId])

-- Add constraints to [dbo].[tblDonorGroups]
ALTER TABLE [dbo].[tblDonorGroups] ADD CONSTRAINT [FK_DonorGroups_DonorGroupTypes] FOREIGN KEY ([DonorGroupTypeId]) REFERENCES [dbo].[tblDonorGroupTypes] ([DonorGroupTypeId])
ALTER TABLE [dbo].[tblDonorGroups] ADD CONSTRAINT [FK_DonorGroups_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId])

-- Add constraints to [dbo].[tblDonorContactInfos]
ALTER TABLE [dbo].[tblDonorContactInfos] ADD CONSTRAINT [FK_DonorContactInfos_ContactInfos] FOREIGN KEY ([ContactInfoId]) REFERENCES [dbo].[tblContactInfos] ([ContactInfoId])
ALTER TABLE [dbo].[tblDonorContactInfos] ADD CONSTRAINT [FK_DonorContactInfos_ContactInfoTypes] FOREIGN KEY ([ContactInfoTypeId]) REFERENCES [dbo].[tblContactInfoTypes] ([ContactInfoTypeId])
ALTER TABLE [dbo].[tblDonorContactInfos] ADD CONSTRAINT [FK_DonorContactInfos_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId])

-- Add constraints to [dbo].[tblContributions]
ALTER TABLE [dbo].[tblContributions] ADD CONSTRAINT [FK_Contributions_Batches] FOREIGN KEY ([BatchId]) REFERENCES [dbo].[tblBatches] ([BatchId])
ALTER TABLE [dbo].[tblContributions] ADD CONSTRAINT [FK_Contributions_ContributionCategories] FOREIGN KEY ([ContributionCategoryId]) REFERENCES [dbo].[tblContributionCategories] ([ContributionCategoryId])
ALTER TABLE [dbo].[tblContributions] ADD CONSTRAINT [FK_Contributions_Donors] FOREIGN KEY ([DonorId]) REFERENCES [dbo].[tblDonors] ([DonorId])
ALTER TABLE [dbo].[tblContributions] ADD CONSTRAINT [FK_Contributions_PaymentTypes] FOREIGN KEY ([PaymentTypeId]) REFERENCES [dbo].[tblPaymentTypes] ([PaymentTypeId])

-- Add constraints to [dbo].[tblAddresses]
ALTER TABLE [dbo].[tblAddresses] ADD CONSTRAINT [FK_Addresses_StateProvinces] FOREIGN KEY ([StateProvinceId]) REFERENCES [dbo].[tblStateProvinces] ([StateProvinceId])

-- Add constraints to [dbo].[tblStateProvinces]
ALTER TABLE [dbo].[tblStateProvinces] ADD CONSTRAINT [FK_StateProvinces_Countries] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[tblCountries] ([CountryId])

-- Add constraints to [dbo].[tblOrganizationContactInfos]
ALTER TABLE [dbo].[tblOrganizationContactInfos] ADD CONSTRAINT [FK_OrganizationContactInfos_ContactInfos] FOREIGN KEY ([ContactInfoId]) REFERENCES [dbo].[tblContactInfos] ([ContactInfoId])
ALTER TABLE [dbo].[tblOrganizationContactInfos] ADD CONSTRAINT [FK_OrganizationContactInfos_ContactInfoTypes] FOREIGN KEY ([ContactInfoTypeId]) REFERENCES [dbo].[tblContactInfoTypes] ([ContactInfoTypeId])
ALTER TABLE [dbo].[tblOrganizationContactInfos] ADD CONSTRAINT [FK_OrganizationContactInfos_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])

-- Add constraints to [dbo].[tblDonors]
ALTER TABLE [dbo].[tblDonors] ADD CONSTRAINT [FK_Donors_DonorStatus] FOREIGN KEY ([DonorStatusId]) REFERENCES [dbo].[tblDonorStatus] ([DonorStatusId])
ALTER TABLE [dbo].[tblDonors] ADD CONSTRAINT [FK_Donors_DonorTypes] FOREIGN KEY ([DonorTypeId]) REFERENCES [dbo].[tblDonorTypes] ([DonorTypeId])
ALTER TABLE [dbo].[tblDonors] ADD CONSTRAINT [FK_Donors_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])

-- Add constraints to [dbo].[tblContributionCategories]
ALTER TABLE [dbo].[tblContributionCategories] ADD CONSTRAINT [FK_ContributionCategories_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])

-- Add constraints to [dbo].[tblBatches]
ALTER TABLE [dbo].[tblBatches] ADD CONSTRAINT [FK_Batches_Organizations] FOREIGN KEY ([OrganizationId]) REFERENCES [dbo].[tblOrganizations] ([OrganizationId])
COMMIT TRANSACTION
GO
