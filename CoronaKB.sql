
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = 'dbo' 
             AND TABLE_NAME = 'RoleProcessAccessUserProcessAc')
BEGIN
    DROP TABLE dbo.RoleProcessAccessUserProcessAc;
END


IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = 'dbo' 
             AND TABLE_NAME = 'RoleProcessAccess')
BEGIN
    DROP TABLE dbo.RoleProcessAccess;
END






IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'RoleProcessAccess')
BEGIN

CREATE TABLE [dbo].[RoleProcessAccess](
	[RoleProcessAccessId] [int] IDENTITY(1,1) NOT NULL,
	[RoleProcessAccessRoleId] [decimal](18, 0) NOT NULL,
	[RoleProcessAccessLifeCycleIds] [nvarchar](max) NOT NULL,
	[RoleProcessAccessCashLifeCycle] [nvarchar](max) NOT NULL,
	[RoleProcessAccessUDLifeCycleId] [nvarchar](max) NOT NULL,
	[RoleProcessAccessCCashLifeCycl] [nvarchar](max) NOT NULL,
	[RoleProcessAccessModule] [nvarchar](20) NOT NULL,
	[RoleProcessAccessCreatedDate] [datetime] NOT NULL,
	[RoleProcessAccessCreatedUser] [nvarchar](max) NOT NULL,
	[RoleProcessAccessLastLine] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleProcessAccessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END



IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'RoleProcessAccessUserProcessAc')
BEGIN

CREATE TABLE [dbo].[RoleProcessAccessUserProcessAc](
	[RoleProcessAccessId] [int] NOT NULL,
	[UserProcessAccessId] [int] NOT NULL,
	[UserGuid] [nvarchar](400) NOT NULL,
	[ActionType] [smallint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedUser] [nvarchar](400) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleProcessAccessId] ASC,
	[UserProcessAccessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[RoleProcessAccessUserProcessAc]  WITH CHECK ADD  CONSTRAINT [IROLEPROCESSACCESSUSERPROCESS1] FOREIGN KEY([RoleProcessAccessId])
REFERENCES [dbo].[RoleProcessAccess] ([RoleProcessAccessId])

END



IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'FEntity' 
               AND COLUMN_NAME = 'FEntityParentId')
BEGIN
    ALTER TABLE [FEntity]
ADD [FEntityParentId] INT    NULL
END




IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'URule')
BEGIN


CREATE TABLE [URule] (
  [URuleId]                INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [URuleName]              NVARCHAR(40)    NOT NULL,
  [ContainerId]            INT    NOT NULL,
  [URuleMatchingCondition] NVARCHAR(MAX)    NOT NULL,
     PRIMARY KEY ( [URuleId] ))
CREATE NONCLUSTERED INDEX [IURULE1] ON [URule] (
      [ContainerId])
ALTER TABLE [URule]
 ADD CONSTRAINT [IURULE1] FOREIGN KEY ( [ContainerId] ) REFERENCES [Container]([ContainerId])

END




ALTER TABLE [FTranProc]
ALTER COLUMN [FTranProcFEntityName] NVARCHAR(200) NOT NULL

ALTER TABLE [FTranProc]
ALTER COLUMN [FTranProcAmount] DECIMAL(17,4) NULL

ALTER TABLE [FTranProc]
ALTER COLUMN [FTranProcFee] DECIMAL(17,4) NULL



IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'DestProfileDestProfileCol' 
               AND COLUMN_NAME = 'DestProfileFixedValue')
BEGIN

   ALTER TABLE [DestProfileDestProfileCol]
ADD [DestProfileFixedValue] NVARCHAR(40)    NULL

END



IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'DestProfileDestProfileCol' 
               AND COLUMN_NAME = 'DestProfileIsRecursive')
BEGIN


ALTER TABLE [DestProfileDestProfileCol]
ADD [DestProfileIsRecursive] BIT    NULL

END


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'Source' 
               AND COLUMN_NAME = 'SourceTFSF')
BEGIN

ALTER TABLE [Source]
ADD [SourceTFSF] BIT    NULL

END






ALTER TABLE [Source]
ALTER COLUMN [SourceEntityId] DECIMAL(18) NULL
ALTER TABLE [Source]
ALTER COLUMN [SourceCategoryId] DECIMAL(18) NULL

  
ALTER TABLE [Userlogs]
ALTER COLUMN [UserlogsUserId] NVARCHAR(400) NULL
ALTER TABLE [Userlogs]
ALTER COLUMN [UserlogsName] NVARCHAR(400) NULL
ALTER TABLE [Userlogs]
ALTER COLUMN [UserlogsActivity] NVARCHAR(40) NULL
ALTER TABLE [Userlogs]
ALTER COLUMN [UserlogsMakerName] NVARCHAR(40) NULL
ALTER TABLE [Userlogs]
ALTER COLUMN [UserlogsMakerId] NVARCHAR(400) NULL
ALTER TABLE [Userlogs]
ALTER COLUMN [UserlogsMakerDate] DATETIME NULL
ALTER TABLE [Userlogs]
ALTER COLUMN [UserlogsCheckerName] NVARCHAR(400) NULL
ALTER TABLE [Userlogs]
ALTER COLUMN [UserlogsCheckerId] NVARCHAR(400) NULL
ALTER TABLE [Userlogs]
ALTER COLUMN [UserlogsCheckerDate] DATETIME NULL






ALTER TABLE [CustomerUsers]
ADD [CustomerUserAuthLevel] SMALLINT    NOT NULL CONSTRAINT CustomerUserAuthLevelCustomerUsers_DEFAULT DEFAULT Convert(INT,0),
    [CustomerUserActCom] SMALLINT    NOT NULL CONSTRAINT CustomerUserActComCustomerUsers_DEFAULT DEFAULT Convert(INT,0)
ALTER TABLE [CustomerUsers]
DROP CONSTRAINT CustomerUserAuthLevelCustomerUsers_DEFAULT
ALTER TABLE [CustomerUsers]
DROP CONSTRAINT CustomerUserActComCustomerUsers_DEFAULT





ALTER TABLE [HierarchyLevel]
ADD [HierarchyLevelAuthLevel] SMALLINT    NOT NULL CONSTRAINT HierarchyLevelAuthLevelHierarchyLevel_DEFAULT DEFAULT Convert(INT,0),
    [HierarchyLevelAuthCom] SMALLINT    NOT NULL CONSTRAINT HierarchyLevelAuthComHierarchyLevel_DEFAULT DEFAULT Convert(INT,0)
ALTER TABLE [HierarchyLevel]
DROP CONSTRAINT HierarchyLevelAuthLevelHierarchyLevel_DEFAULT
ALTER TABLE [HierarchyLevel]
DROP CONSTRAINT HierarchyLevelAuthComHierarchyLevel_DEFAULT





   IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'URuleURulesLevel')
BEGIN

CREATE TABLE [URuleURulesLevel] (
  [URuleId] INT    NOT NULL,
  [FId]     INT    NOT NULL,
  [F1]      NVARCHAR(40)    NOT NULL,
  [F2]      NVARCHAR(40)    NOT NULL,
     PRIMARY KEY ( [URuleId],[FId] ))
ALTER TABLE [URuleURulesLevel]
 ADD CONSTRAINT [IURULEURULESLEVEL1] FOREIGN KEY ( [URuleId] ) REFERENCES [URule]([URuleId])

 END


   IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'SystemRole')
BEGIN

CREATE TABLE [SystemRole] (
  [SystemRoleId]          INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [SystemRoleName]        NVARCHAR(40)    NOT NULL,
  [SystemRoleDescription] NVARCHAR(200)    NOT NULL,
  [SystemRoleCreDate]     DATETIME    NOT NULL,
  [SystemRoleCreUser]     NVARCHAR(400)    NOT NULL,
  [SystemRoleAuthLevel]   SMALLINT    NOT NULL,
  [SystemRoleAuthCom]     SMALLINT    NOT NULL,
     PRIMARY KEY ( [SystemRoleId] ))

END

     INSERT INTO SystemRole (SystemRoleName, SystemRoleDescription, SystemRoleCreDate, SystemRoleCreUser, SystemRoleAuthLevel, SystemRoleAuthCom)
SELECT 
    TRIM(RoleName) AS SystemRoleName, 
    RoleDsc AS SystemRoleDescription, 
    RoleCreDate AS SystemRoleCreDate, 
    RoleCreUser AS SystemRoleCreUser, 
    2 AS SystemRoleAuthLevel, 
    1 AS SystemRoleAuthCom
FROM gam.[Role] R 
WHERE NOT EXISTS (
    SELECT 1 FROM SystemRole SR WHERE SR.SystemRoleName = TRIM(R.RoleName)
) AND R.RoleExtId != '' AND  TRIM(R.RoleExtId) !=  'is_gam_administrator'



  IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'CaseStage')
BEGIN


CREATE TABLE [CaseStage] (
  [CaseStageId]                INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [CaseStageName]              NVARCHAR(40)    NOT NULL,
  [CaseStageIsLast]            BIT    NOT NULL,
  [CaseStageIsCustomerDeliver] BIT    NOT NULL,
     PRIMARY KEY ( [CaseStageId] ))


END

	 
  IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'OSProc')
BEGIN



     
CREATE TABLE [OSProc] (
  [OSProcId]            INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [OSProcLoadTimeStamp] DATETIME    NOT NULL,
  [OSProcEventId]       INT    NOT NULL,
  [OSProcSign]          NCHAR(1)    NOT NULL,
  [OSProcTrnDate]       DATETIME    NOT NULL,
  [OSProcAmount]        DECIMAL(17,4)    NOT NULL,
  [OSProcDate1]         DATETIME    NULL,
  [OSProcDate2]         DATETIME    NULL,
  [OSProcDate3]         DATETIME    NULL,
  [OSProcDate4]         DATETIME    NULL,
  [OSProcDate5]         DATETIME    NULL,
  [OSProcAmount1]       DECIMAL(17,4)    NULL,
  [OSProcAmount2]       DECIMAL(17,4)    NULL,
  [OSProcAmount3]       DECIMAL(17,4)    NULL,
  [OSProcAmount4]       DECIMAL(17,4)    NULL,
  [OSProcAmount5]       DECIMAL(17,4)    NULL,
  [OSProcText1]         NVARCHAR(4000)    NULL,
  [OSProcText2]         NVARCHAR(4000)    NULL,
  [OSProcText3]         NVARCHAR(4000)    NULL,
  [OSProcText4]         NVARCHAR(4000)    NULL,
  [OSProcText5]         NVARCHAR(4000)    NULL,
  [OSProcText6]         NVARCHAR(4000)    NULL,
  [OSProcText7]         NVARCHAR(4000)    NULL,
  [OSProcText8]         NVARCHAR(4000)    NULL,
  [OSProcText9]         NVARCHAR(4000)    NULL,
  [OSProcText10]        NVARCHAR(4000)    NULL,
  [OSProcText11]        NVARCHAR(4000)    NULL,
  [OSProcText12]        NVARCHAR(4000)    NULL,
  [OSProcText13]        NVARCHAR(4000)    NULL,
  [OSProcText14]        NVARCHAR(4000)    NULL,
  [OSProcText15]        NVARCHAR(4000)    NULL,
  [OSProcText16]        NVARCHAR(4000)    NULL,
  [OSProcText17]        NVARCHAR(4000)    NULL,
  [OSProcText18]        NVARCHAR(4000)    NULL,
  [OSProcText19]        NVARCHAR(4000)    NULL,
  [OSProcText20]        NVARCHAR(4000)    NULL,
  [OSProcText21]        NVARCHAR(4000)    NULL,
  [OSProcText22]        NVARCHAR(4000)    NULL,
  [OSProcText23]        NVARCHAR(4000)    NULL,
  [OSProcText24]        NVARCHAR(4000)    NULL,
  [OSProcText25]        NVARCHAR(4000)    NULL,
  [OSProcText26]        NVARCHAR(4000)    NULL,
  [OSProcText27]        NVARCHAR(4000)    NULL,
  [OSProcText28]        NVARCHAR(4000)    NULL,
  [OSProcText29]        NVARCHAR(4000)    NULL,
  [OSProcText30]        NVARCHAR(4000)    NULL,
  [OSProcText31]        NVARCHAR(4000)    NULL,
  [OSProcText32]        NVARCHAR(4000)    NULL,
  [OSProcText33]        NVARCHAR(4000)    NULL,
  [OSProcText34]        NVARCHAR(4000)    NULL,
  [OSProcText35]        NVARCHAR(4000)    NULL,
  [OSProcInvLevel]      SMALLINT    NOT NULL,
  [OSProcFrcActCom]     SMALLINT    NOT NULL,
  [OSProcAuthLevel]     SMALLINT    NOT NULL,
  [OSProcIsResolved]    BIT    NOT NULL,
     PRIMARY KEY ( [OSProcId] ))
CREATE NONCLUSTERED INDEX [IOSPROC1] ON [OSProc] (
      [OSProcEventId])
ALTER TABLE [OSProc]
 ADD CONSTRAINT [IOSPROC1] FOREIGN KEY ( [OSProcEventId] ) REFERENCES [OSProcEvent]([OSProcEventId])

 END


  IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'OSProcEventColumnMaster')
BEGIN


 
 
CREATE TABLE [OSProcEventColumnMaster] (
  [OSProcEventId]           INT    NOT NULL,
  [ColumnMasterId]          INT    NOT NULL,
  [ColumnMasterSrNo]        SMALLINT    NOT NULL,
  [ColumnMasterType]        NVARCHAR(1)    NOT NULL,
  [ColumnMasterUHeader]     NVARCHAR(400)    NOT NULL,
  [ColumnMasterEventHeader] NVARCHAR(400)    NOT NULL,
     PRIMARY KEY ( [OSProcEventId],[ColumnMasterId] ))
ALTER TABLE [OSProcEventColumnMaster]
 ADD CONSTRAINT [IOSPROCEVENTCOLUMNMASTER1] FOREIGN KEY ( [OSProcEventId] ) REFERENCES [OSProcEvent]([OSProcEventId])



 END



 
 	   
 IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'OSProcEvent')
BEGIN

 CREATE TABLE [OSProcEvent] (
  [OSProcEventId]       INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [OSProcEventName]     NVARCHAR(40)    NOT NULL,
  [OSProcEventLastLine] SMALLINT    NOT NULL,
     PRIMARY KEY ( [OSProcEventId] ))

	 END

	   
 IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'CaseCardStatus')
BEGIN

     CREATE TABLE [CaseCardStatus] (
  [CaseCardStatusId]   INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [CaseCardStatusName] NVARCHAR(40)    NOT NULL,
     PRIMARY KEY ( [CaseCardStatusId] ))

	 END

	  
 IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'CaseCurrentStatus')
BEGIN

     CREATE TABLE [CaseCurrentStatus] (
  [CaseCurrentStatusId]   INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [CaseCurrentStatusName] NVARCHAR(40)    NOT NULL,
     PRIMARY KEY ( [CaseCurrentStatusId] ))


END

	  
 IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'CardCapture')
BEGIN


	 
CREATE TABLE [CardCapture] (
  [CardCaptureId]              DECIMAL(18)    NOT NULL    IDENTITY ( 1 , 1 ),
  [CaseCurrentStatusId]        INT    NOT NULL,
  [CaseCardStatusId]           INT    NOT NULL,
  [CaseStageId]                INT    NOT NULL,
  [CardCaptureTicketNo]        NVARCHAR(90)    NOT NULL,
  [CardCaptureCaseNo]          DECIMAL(18)    NOT NULL,
  [CardCaptureDate]            DATETIME    NOT NULL,
  [CardCaptureResolutionDate]  DATETIME    NOT NULL,
  [CardCaptureIssuingBranch]   NVARCHAR(90)    NOT NULL,
  [CardCaptureAcquiringBranch] NVARCHAR(90)    NOT NULL,
  [CardCaptureNicNo]           NVARCHAR(40)    NOT NULL,
  [CardCaptureAccountNo]       NVARCHAR(40)    NOT NULL,
  [CardCaptureCardNo]          NVARCHAR(40)    NOT NULL,
  [CardCaptureAging]           INT    NOT NULL,
  [CardCaptureTatWiseStage]    NVARCHAR(40)    NOT NULL,
     PRIMARY KEY ( [CardCaptureId] ))
CREATE NONCLUSTERED INDEX [ICARDCAPTURE1] ON [CardCapture] (
      [CaseStageId])
CREATE NONCLUSTERED INDEX [ICARDCAPTURE2] ON [CardCapture] (
      [CaseCardStatusId])
CREATE NONCLUSTERED INDEX [ICARDCAPTURE3] ON [CardCapture] (
      [CaseCurrentStatusId])
ALTER TABLE [CardCapture]
 ADD CONSTRAINT [ICARDCAPTURE3] FOREIGN KEY ( [CaseCurrentStatusId] ) REFERENCES [CaseCurrentStatus]([CaseCurrentStatusId])
ALTER TABLE [CardCapture]
 ADD CONSTRAINT [ICARDCAPTURE2] FOREIGN KEY ( [CaseCardStatusId] ) REFERENCES [CaseCardStatus]([CaseCardStatusId])
ALTER TABLE [CardCapture]
 ADD CONSTRAINT [ICARDCAPTURE1] FOREIGN KEY ( [CaseStageId] ) REFERENCES [CaseStage]([CaseStageId])


 END



 
 IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'CaseCaptureBreakup')
BEGIN

CREATE TABLE [CaseCaptureBreakup] (
  [CaseCaptureId]               INT    NOT NULL,
  [CaseCaptureBreakupId]        INT    NOT NULL,
  [CaseCaptureBreakupCaseName]  NVARCHAR(40)    NOT NULL,
  [CaseCaptureBreakupTatInDays] INT    NOT NULL,
  [CaseStageId]                 INT    NOT NULL,
     PRIMARY KEY ( [CaseCaptureId],[CaseCaptureBreakupId] ))
CREATE NONCLUSTERED INDEX [ICASECAPTUREBREAKUP1] ON [CaseCaptureBreakup] (
      [CaseStageId])
ALTER TABLE [CaseCaptureBreakup]
 ADD CONSTRAINT [ICASECAPTUREBREAKUP2] FOREIGN KEY ( [CaseCaptureId] ) REFERENCES [CaseCapture]([CaseCaptureId])
ALTER TABLE [CaseCaptureBreakup]
 ADD CONSTRAINT [ICASECAPTUREBREAKUP1] FOREIGN KEY ( [CaseStageId] ) REFERENCES [CaseStage]([CaseStageId])

 End

 IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'CaseCapture')
BEGIN
 
CREATE TABLE [CaseCapture] (
  [CaseCaptureId]        INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [CaseCaptureName]      NVARCHAR(40)    NOT NULL,
  [CaseCaptureTatInDays] INT    NOT NULL,
  [CaseCaptureLastLine]  SMALLINT    NOT NULL,
     PRIMARY KEY ( [CaseCaptureId] ))



	  END



	  

     CREATE UNIQUE NONCLUSTERED INDEX [UBANK] ON [Bank] (
      [BankName])
      