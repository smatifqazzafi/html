

IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'Rolelogs')
BEGIN

CREATE TABLE [dbo].[Rolelogs](
	[RolelogsId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[RolelogsRoleId] [decimal](18, 0) NOT NULL,
	[RolelogsRoleName] [nvarchar](40) NULL,
	[RolelogsRoleActivity] [nvarchar](40) NULL,
	[RolelogsMakerName] [nvarchar](40) NULL,
	[RoleLogMakerId] [nvarchar](400) NULL,
	[RolelogsMakerDate] [datetime] NULL,
	[RolelogsCheckerName] [nvarchar](40) NULL,
	[RolelogsCheckerId] [nvarchar](400) NULL,
	[RolelogsCheckerDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RolelogsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


END


IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'Userlogs')
BEGIN

CREATE TABLE [dbo].[Userlogs](
	[UserlogsId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[UserlogsUserId] [nvarchar](400) NOT NULL,
	[UserlogsName] [nvarchar](400) NOT NULL,
	[UserlogsActivity] [nvarchar](40) NOT NULL,
	[UserlogsMakerName] [nvarchar](40) NOT NULL,
	[UserlogsMakerId] [nvarchar](400) NOT NULL,
	[UserlogsMakerDate] [datetime] NOT NULL,
	[UserlogsCheckerName] [nvarchar](400) NOT NULL,
	[UserlogsCheckerId] [nvarchar](400) NOT NULL,
	[UserlogsCheckerDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserlogsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'DestProfileDestProfileCol' 
               AND COLUMN_NAME = 'DestProfileSectionNumber')
BEGIN
    ALTER TABLE DestProfileDestProfileCol
    ADD DestProfileSectionNumber SMALLINT NULL;
END

GO

IF NOT EXISTS (SELECT 1 FROM [TLMOCC10].[gam].[AppPermission] WHERE TRIM ([AppPrmName] )= 'wpaclmisreport_Execute')
BEGIN
INSERT INTO [TLMOCC10].[gam].[AppPermission] ([RepId], [AppId], [AppPrmGUID], [AppPrmName], [AppPrmDsc], [AppPrmPgmName], [AppPrmDefType], [AppPrmTokenTypeGUID], [AppPrmCreDate], [AppPrmCreUser], [AppPrmUpdDate], [AppPrmUpdUser], [AppPrmCurEnvId], [AppPrmPgmPar], [AppPrmIsGXAuto]) VALUES (2, 2, 'dd26ef69-b833-47b9-94b5-7932cf9f953a', 'wpaclmisreport_Execute                                                                              ', 'Reconciliation                                                                                                                                                                                                                                                ', 'wpaclmisreport                                                                                      ', 'R', '                                    ', 'Jan 24 2025  7:30PM', 'ccec080a-4292-429f-9ab5-f52f083e8a78', 'Jan 24 2025  7:30PM' , 'ccec080a-4292-429f-9ab5-f52f083e8a78', 1, '                                                                                                    ', 1);
END;
IF NOT EXISTS (SELECT 1 FROM [TLMOCC10].[gam].[AppPermission] WHERE TRIM ([AppPrmName] )= 'wpauditetrailmisreport_Execute')
BEGIN
INSERT INTO [TLMOCC10].[gam].[AppPermission] ([RepId], [AppId], [AppPrmGUID], [AppPrmName], [AppPrmDsc], [AppPrmPgmName], [AppPrmDefType], [AppPrmTokenTypeGUID], [AppPrmCreDate], [AppPrmCreUser], [AppPrmUpdDate], [AppPrmUpdUser], [AppPrmCurEnvId], [AppPrmPgmPar], [AppPrmIsGXAuto]) VALUES (2, 2, '9c084094-ec89-4c48-a30f-bd5b7071c386', 'wpauditetrailmisreport_Execute                                                                      ', 'Reconciliation                                                                                                                                                                                                                                                ', 'wpaclmisreport                                                                                      ', 'R', '                                    ', 'Jan 24 2025 12:43PM', 'ccec080a-4292-429f-9ab5-f52f083e8a78', 'Jan 24 2025 12:43PM' , 'ccec080a-4292-429f-9ab5-f52f083e8a78', 1, '                                                                                                    ', 1);
END;
IF NOT EXISTS (SELECT 1 FROM [TLMOCC10].[gam].[AppPermission] WHERE TRIM ([AppPrmName] )= 'wplogs_Execute')
BEGIN
INSERT INTO [TLMOCC10].[gam].[AppPermission] ([RepId], [AppId], [AppPrmGUID], [AppPrmName], [AppPrmDsc], [AppPrmPgmName], [AppPrmDefType], [AppPrmTokenTypeGUID], [AppPrmCreDate], [AppPrmCreUser], [AppPrmUpdDate], [AppPrmUpdUser], [AppPrmCurEnvId], [AppPrmPgmPar], [AppPrmIsGXAuto]) VALUES (2, 2, '5ca566d8-f546-4741-a86e-8395db0cffc9', 'wplogs_Execute                                                                                      ', 'Logs                                                                                                                                                                                                                                                          ', 'wplogs                                                                                              ', 'R', '                                    ', 'Jan 23 2025  5:15PM', 'ccec080a-4292-429f-9ab5-f52f083e8a78', 'Jan 23 2025  6:53PM' , 'ccec080a-4292-429f-9ab5-f52f083e8a78', 1, '                                                                                                    ', 1);
END;








--Delete From ColMasterUserColMaster
--Delete From ColMasterUser
--Delete From ColMaster





IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'FTranProc' 
               AND COLUMN_NAME = 'FTranProcExchangeRate')
BEGIN

ALTER TABLE [FTranProc]
ADD [FTranProcExchangeRate] SMALLMONEY NULL

END



IF NOT EXISTS (SELECT 1 
               FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' 
                 AND TABLE_NAME = 'RoleProcessAccess')
BEGIN


GO

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
GO



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
	[CreatedDate] [datetime] NOT NULL,
	[CreatedUser] [nvarchar](400) NOT NULL,
	[ActionType] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleProcessAccessId] ASC,
	[UserProcessAccessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RoleProcessAccessUserProcessAc]  WITH CHECK ADD  CONSTRAINT [IROLEPROCESSACCESSUSERPROCESS1] FOREIGN KEY([RoleProcessAccessId])
REFERENCES [dbo].[RoleProcessAccess] ([RoleProcessAccessId])
GO

ALTER TABLE [dbo].[RoleProcessAccessUserProcessAc] CHECK CONSTRAINT [IROLEPROCESSACCESSUSERPROCESS1]
GO

END


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'FEntity' 
               AND COLUMN_NAME = 'FEntityParentId')
BEGIN
    ALTER TABLE [FEntity]
ADD [FEntityParentId] INT    NULL
END

GO

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
               AND COLUMN_NAME = 'DestProfileFunction')
BEGIN

   ALTER TABLE [DestProfileDestProfileCol]
ADD [DestProfileFunction] NVARCHAR(40)    NULL

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




CREATE TABLE [URuleURulesLevel] (
  [URuleId] INT    NOT NULL,
  [FId]     INT    NOT NULL,
  [F1]      NVARCHAR(40)    NOT NULL,
  [F2]      NVARCHAR(40)    NOT NULL,
     PRIMARY KEY ( [URuleId],[FId] ))
ALTER TABLE [URuleURulesLevel]
 ADD CONSTRAINT [IURULEURULESLEVEL1] FOREIGN KEY ( [URuleId] ) REFERENCES [URule]([URuleId])




 
CREATE TABLE [GAMRole] (
  [GAMRoleId]          INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [GAMRoleName]        NVARCHAR(40)    NOT NULL,
  [GAMRoleDescription] NVARCHAR(200)    NOT NULL,
  [GAMRoleCreDate]     DATETIME    NOT NULL,
  [GAMRoleCreUser]     SMALLINT    NOT NULL,
  [GAMRoleAuthLevel]   SMALLINT    NOT NULL,
  [GAMRoleAuthCom]     SMALLINT    NOT NULL,
     PRIMARY KEY ( [GAMRoleId] ))





     
DROP TABLE [GAMRole]




CREATE TABLE [SystemRole] (
  [SystemRoleId]          INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [SystemRoleName]        NVARCHAR(40)    NOT NULL,
  [SystemRoleDescription] NVARCHAR(200)    NOT NULL,
  [SystemRoleCreDate]     DATETIME    NOT NULL,
  [SystemRoleCreUser]     NVARCHAR(400)    NOT NULL,
  [SystemRoleAuthLevel]   SMALLINT    NOT NULL,
  [SystemRoleAuthCom]     SMALLINT    NOT NULL,
     PRIMARY KEY ( [SystemRoleId] ))

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



CREATE TABLE [CaseStage] (
  [CaseStageId]                INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [CaseStageName]              NVARCHAR(40)    NOT NULL,
  [CaseStageIsLast]            BIT    NOT NULL,
  [CaseStageIsCustomerDeliver] BIT    NOT NULL,
     PRIMARY KEY ( [CaseStageId] ))




     
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




 CREATE TABLE [OSProcEvent] (
  [OSProcEventId]       INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [OSProcEventName]     NVARCHAR(40)    NOT NULL,
  [OSProcEventLastLine] SMALLINT    NOT NULL,
     PRIMARY KEY ( [OSProcEventId] ))




     CREATE TABLE [CaseCardStatus] (
  [CaseCardStatusId]   INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [CaseCardStatusName] NVARCHAR(40)    NOT NULL,
     PRIMARY KEY ( [CaseCardStatusId] ))


     CREATE TABLE [CaseCurrentStatus] (
  [CaseCurrentStatusId]   INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [CaseCurrentStatusName] NVARCHAR(40)    NOT NULL,
     PRIMARY KEY ( [CaseCurrentStatusId] ))



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




 
CREATE TABLE [CaseCapture] (
  [CaseCaptureId]        INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [CaseCaptureName]      NVARCHAR(40)    NOT NULL,
  [CaseCaptureTatInDays] INT    NOT NULL,
  [CaseCaptureLastLine]  SMALLINT    NOT NULL,
     PRIMARY KEY ( [CaseCaptureId] ))


     CREATE UNIQUE NONCLUSTERED INDEX [UBANK] ON [Bank] (
      [BankName])



--------------------------This Script Must be change from DB
      
DROP INDEX [IFCUREXRATE1] ON [FCurExRate]
ALTER TABLE [FCurExRate]
DROP CONSTRAINT [IFCUREXRATE1]
ALTER TABLE [FCurExRate]
ALTER COLUMN [TrCurCode] NVARCHAR(10) NOT NULL
CREATE NONCLUSTERED INDEX [IFCUREXRATE1] ON [FCurExRate] (
      [TrCurCode])
ALTER TABLE [FCurExRate]
 ADD CONSTRAINT [IFCUREXRATE1] FOREIGN KEY ( [TrCurCode] ) REFERENCES [TrCur]([TrCurCode])



 
DROP INDEX [IFCAT1] ON [FCat]
ALTER TABLE [FCat]
DROP CONSTRAINT [IFCAT1]
ALTER TABLE [FCat]
ALTER COLUMN [TrCurCode] NVARCHAR(10) NOT NULL
CREATE NONCLUSTERED INDEX [IFCAT1] ON [FCat] (
      [TrCurCode])
ALTER TABLE [FCat]
 ADD CONSTRAINT [IFCAT1] FOREIGN KEY ( [TrCurCode] ) REFERENCES [TrCur]([TrCurCode])



 
DROP INDEX [INGRPACC1] ON [NGrpAcc]
ALTER TABLE [NGrpAcc]
DROP CONSTRAINT [INGRPACC1]
ALTER TABLE [NGrpAcc]
ALTER COLUMN [TrCurCode] NVARCHAR(10) NOT NULL
CREATE NONCLUSTERED INDEX [INGRPACC1] ON [NGrpAcc] (
      [TrCurCode])
ALTER TABLE [NGrpAcc]
 ADD CONSTRAINT [INGRPACC1] FOREIGN KEY ( [TrCurCode] ) REFERENCES [TrCur]([TrCurCode])



 
DROP INDEX [IDGRPACC1] ON [DGrpAcc]
ALTER TABLE [DGrpAcc]
DROP CONSTRAINT [IDGRPACC1]
ALTER TABLE [DGrpAcc]
ALTER COLUMN [TrCurCode] NVARCHAR(10) NOT NULL
CREATE NONCLUSTERED INDEX [IDGRPACC1] ON [DGrpAcc] (
      [TrCurCode])
ALTER TABLE [DGrpAcc]
 ADD CONSTRAINT [IDGRPACC1] FOREIGN KEY ( [TrCurCode] ) REFERENCES [TrCur]([TrCurCode])




 DROP INDEX [ICGRPACC2] ON [CGrpAcc]
ALTER TABLE [CGrpAcc]
DROP CONSTRAINT [ICGRPACC2]
ALTER TABLE [CGrpAcc]
ALTER COLUMN [TrCurCode] NVARCHAR(10) NOT NULL
CREATE NONCLUSTERED INDEX [ICGRPACC2] ON [CGrpAcc] (
      [TrCurCode])
ALTER TABLE [CGrpAcc]
 ADD CONSTRAINT [ICGRPACC2] FOREIGN KEY ( [TrCurCode] ) REFERENCES [TrCur]([TrCurCode])
ALTER TABLE [CGrpAcc]
 ADD CONSTRAINT [ICGRPACC1] FOREIGN KEY ( [CAAreaId] ) REFERENCES [CAArea]([CAAreaId])




 
ALTER TABLE [TrCur]
ALTER COLUMN [TrCurCode] NVARCHAR(10) NOT NULL
ALTER TABLE [TrCur]
 ADD    PRIMARY KEY ( [TrCurCode] )


 
--------------------------This Script Must be change from DB




ALTER TABLE [SystemRole]
ADD [SystemRoleParentId] DECIMAL(18)    NOT NULL CONSTRAINT SystemRoleParentIdSystemRole_DEFAULT DEFAULT Convert(INT,0)
ALTER TABLE [SystemRole]
DROP CONSTRAINT SystemRoleParentIdSystemRole_DEFAULT



INSERT INTO SystemRole
      (SystemRoleName, SystemRoleDescription, SystemRoleCreDate, SystemRoleCreUser, SystemRoleAuthLevel, SystemRoleAuthCom,SystemRoleParentId)
SELECT
      TRIM(RoleName) AS SystemRoleName,
      RoleDsc AS SystemRoleDescription,
      RoleCreDate AS SystemRoleCreDate,
      RoleCreUser AS SystemRoleCreUser,
      2 AS SystemRoleAuthLevel,
      1 AS SystemRoleAuthCom,
      ISNULL((Select TOP 1
            RoleMemRoleParent
      From gam.[RoleMemRole]
      Where RoleMemRoleChild = R.RoleId),0) AS SystemRoleParentId
FROM gam.[Role] R
WHERE NOT EXISTS (
    SELECT 1
      FROM SystemRole SR
      WHERE SR.SystemRoleName = TRIM(R.RoleName)
) AND R.RoleExtId != '' AND TRIM(R.RoleExtId) !=  'is_gam_administrator'




ALTER TABLE [RoleProcessAccess]
ADD [RoleProcessAccessAuthLevel] SMALLINT    NOT NULL CONSTRAINT RoleProcessAccessAuthLevelRoleProcessAccess_DEFAULT DEFAULT Convert(INT,0),
    [RoleProcessAccessAuthCom] SMALLINT    NOT NULL CONSTRAINT RoleProcessAccessAuthComRoleProcessAccess_DEFAULT DEFAULT Convert(INT,0)
ALTER TABLE [RoleProcessAccess]
DROP CONSTRAINT RoleProcessAccessAuthLevelRoleProcessAccess_DEFAULT
ALTER TABLE [RoleProcessAccess]
DROP CONSTRAINT RoleProcessAccessAuthComRoleProcessAccess_DEFAULT




CREATE TABLE [UserActionLogs] (
  [UserActionLogId]          INT    NOT NULL    IDENTITY ( 1 , 1 ),
  [UserActionLogTable]       NVARCHAR(40)    NOT NULL,
  [UserActionLogEntityId]    NVARCHAR(40)    NOT NULL,
  [UserActionLogType]        NVARCHAR(40)    NOT NULL,
  [UserActionLogUserGuid]    NVARCHAR(40)    NOT NULL,
  [UserActionLogCreatedDate] DATETIME    NOT NULL,
  [UserActionLogRemarks]     NVARCHAR(200)    NOT NULL,
     PRIMARY KEY ( [UserActionLogId] ))




     ALTER TABLE [SrcProfileSrcProfileColColFun]
ALTER COLUMN [ColFunP2] NVARCHAR(MAX) NOT NULL



ALTER TABLE [SrcProfileSrcProfileColColFun]
ALTER COLUMN [ColFunP1] NVARCHAR(MAX) NOT NULL



CREATE TABLE [MailTemplate]
(
      [MailTemplateTemplateName] NVARCHAR(100) NOT NULL,
      [MailTemplateDescription] NVARCHAR(200) NOT NULL,
      [MailTemplateSubject] NVARCHAR(80) NOT NULL,
      [MailTemplateBody] NVARCHAR(MAX) NOT NULL,
      [MailTemplateToken] NVARCHAR(400) NOT NULL,
      PRIMARY KEY ( [MailTemplateTemplateName] )
)


DROP INDEX [UBANK] ON [Bank]
CREATE UNIQUE NONCLUSTERED INDEX [UBANKNAME] ON [Bank] (
      [BankName])



      IF OBJECT_ID(N'dbo.vw_UserMemberRoles', N'V') IS NOT NULL
BEGIN
      DROP VIEW dbo.vw_UserMemberRoles;
END;
GO
CREATE VIEW vw_UserMemberRoles
AS
      SELECT
            u3.UserName AS UserName,
            TRIM(r.RoleName) AS UserMemberRoleName,
            CONVERT(VARCHAR, umr.UserMemRoleCreDate, 103) AS UserMemRoleCreDate,
            u1.UserName AS UserMemberRoleCreUserName,
            CONVERT(VARCHAR, umr.UserMemRoleUpdDate, 103) AS UserMemRoleUpdDate,
            u2.UserName AS UserMemberRoleUpdUserName    ,
            umr.UserMemRoleRoleId,
            TRIM(umr.UserGUID) AS    UserGUID
      FROM gam.[UserMemRole] umr
            INNER JOIN gam.[User] u1 ON umr.UserMemRoleCreUser = u1.UserGUID
            INNER JOIN gam.[User] u2 ON umr.UserMemRoleUpdUser = u2.UserGUID
            INNER JOIN gam.[User] u3 ON umr.UserGUID = u3.UserGUID
            INNER JOIN gam.[Role] r ON umr.UserMemRoleRoleId = r.RoleId; 



-------------  THis Script has transfer to faysal bank

Go
ALTER TABLE [CGrpAcc]
ADD [CGrpAccBlncValidate] BIT    NULL
Update CGrpAcc Set  CGrpAccBlncValidate = 1


CREATE UNIQUE NONCLUSTERED INDEX [UDRULE] ON [DRule] (
      [DRuleName])

CREATE NONCLUSTERED INDEX [UDGRPACC] ON [DGrpAcc] (
      [DGrpAccName])

CREATE UNIQUE NONCLUSTERED INDEX [UCRULE] ON [CRule] (
      [CRuleName])

CREATE UNIQUE NONCLUSTERED INDEX [UCGRPACC] ON [CGrpAcc] (
      [CGrpAccName])


GO
CREATE VIEW vw_ACL
AS
      SELECT
            U.UserGUID,
            U.UserName,
            TRIM(U.UserFirstName) + ' ' + TRIM(U.UserLastName) AS FullName,
            ISNULL(   
        STUFF((    
            SELECT ', ' + ISNULL(TRIM(R.RoleName), '')
            FROM gam.[UserMemRole] UR
                  JOIN gam.[Role] R ON UR.UserMemRoleRoleId = R.RoleId
            WHERE UR.UserGUID = U.UserGUID
            FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ''),    
        ''    
    ) AS RoleNames,
            U.UserCreDate,
            ISNULL(createUser.UserName, '') AS UserCreUser,
            U.UserUpdDate,
            ISNULL(UpdUser.UserName, '') AS UserUpdUser ,
            U.UserDateLastChgPwd,
            U.UserDateLastAuth,
            U.UserIsBlk,
            U.UserBlkLastDate,
            U.UserIsAct,
            U.UserActDate,
            U.UserIsDlt
      FROM gam.[User] U
            LEFT JOIN gam.[UserMemRole] UR ON U.UserGUID = UR.UserGUID
            LEFT JOIN gam.[Role] R ON UR.UserMemRoleRoleId = R.RoleId
            LEFT JOIN gam.[User] UpdUser ON U.UserUpdUser = UpdUser.UserGUID
            LEFT JOIN gam.[User] createUser ON U.UserCreUser = createUser.UserGUID;   
  
  
  

GO

ALTER VIEW vw_UserMemberRoles AS          
SELECT           
    u3.UserName AS UserName,          
    TRIM(r.RoleName) AS UserMemberRoleName,           
    umr.UserMemRoleCreDate,            
    u1.UserName AS UserMemberRoleCreUserName,          
    umr.UserMemRoleUpdDate  ,    
    u2.UserName AS UserMemberRoleUpdUserName    ,      
    umr.UserMemRoleRoleId,  
 TRIM(umr.UserGUID) AS    UserGUID  
FROM gam.[UserMemRole] umr          
INNER JOIN gam.[User] u1 ON umr.UserMemRoleCreUser = u1.UserGUID          
INNER JOIN gam.[User] u2 ON umr.UserMemRoleUpdUser = u2.UserGUID          
INNER JOIN gam.[User] u3 ON umr.UserGUID = u3.UserGUID          
INNER JOIN gam.[Role] r ON umr.UserMemRoleRoleId = r.RoleId; 










GO


CREATE PROCEDURE InsertRoleAppPrm
      @RoleName NVARCHAR(255),
      @RoleId INT
AS
BEGIN
      SET NOCOUNT ON;

      WITH
            cte
            AS
            (
                  SELECT
                        RepId,
                        (SELECT TOP 1
                              RoleId
                        FROM gam.Role
                        WHERE RoleName = @RoleName) AS Roleid,
                        AppId,
                        AppPrmGUID,
                        RoleAppPrmToken,
                        RoleAppPrmType,
                        RoleAppPrmInh,
                        RoleAppPrmCreDate,
                        RoleAppPrmCreUser,
                        RoleAppPrmUpdDate,
                        RoleAppPrmUpdUser,
                        AppPrmName
                  FROM gam.RoleAppPrm
                  WHERE RoleId = @RoleId
                        AND AppId = 2
            )
      INSERT INTO gam.RoleAppPrm
            (
            RepId, RoleId, AppId, AppPrmGUID, RoleAppPrmToken, RoleAppPrmType,
            RoleAppPrmInh, RoleAppPrmCreDate, RoleAppPrmCreUser, RoleAppPrmUpdDate,
            RoleAppPrmUpdUser, AppPrmName
            )
      SELECT
            RepId, Roleid, AppId, AppPrmGUID, RoleAppPrmToken, RoleAppPrmType,
            RoleAppPrmInh, RoleAppPrmCreDate, RoleAppPrmCreUser, RoleAppPrmUpdDate,
            RoleAppPrmUpdUser, AppPrmName
      FROM cte
      WHERE NOT EXISTS (
        SELECT 1
      FROM gam.RoleAppPrm r
      WHERE 
            r.RepId = cte.RepId
            AND r.RoleId = cte.Roleid
            AND r.AppId = cte.AppId
            AND r.AppPrmGUID = cte.AppPrmGUID
            AND r.RoleAppPrmToken = cte.RoleAppPrmToken
            AND r.RoleAppPrmType = cte.RoleAppPrmType
            AND r.RoleAppPrmInh = cte.RoleAppPrmInh
            AND r.AppPrmName = cte.AppPrmName
    );
END;
