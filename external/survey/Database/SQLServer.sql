CREATE TABLE [Fish] (
  [FishId] int PRIMARY KEY IDENTITY(1, 1),
  [ScientificNameID] int,
  [TrophicID] int
)
GO

CREATE TABLE [FamilyName] (
  [FamilyNameId] int PRIMARY KEY IDENTITY(1, 1),
  [FamilyName] nvarchar(255)
)
GO

CREATE TABLE [ScientificName] (
  [ScientificNameID] int PRIMARY KEY IDENTITY(1, 1),
  [ScientificName] nvarchar(255),
  [CommonName] nvarchar(255),
  [FamilyNameId] int
)
GO

CREATE TABLE [Trophic] (
  [TrophicID] int PRIMARY KEY,
  [Trophic] nvarchar(255)
)
GO

CREATE TABLE [Survey] (
  [SurveyIndex] int PRIMARY KEY IDENTITY(1, 1),
  [SurveyDate] date,
  [BatchCodeId] int,
  [ManagementId] int,
  [StructureTypeId] int,
  [LocationId] int
)
GO

CREATE TABLE [BatchCode] (
  [BatchCodeId] int PRIMARY KEY IDENTITY(1, 1),
  [BatchCode] nvarchar(255)
)
GO

CREATE TABLE [Management] (
  [ManagementId] int PRIMARY KEY IDENTITY(1, 1),
  [ManagementName] nvarchar(255)
)
GO

CREATE TABLE [StructureType] (
  [StructureTypeId] int PRIMARY KEY IDENTITY(1, 1),
  [StructureType] nvarchar(255)
)
GO

CREATE TABLE [Region] (
  [RegionId] int PRIMARY KEY IDENTITY(1, 1),
  [RegionName] nvarchar(255)
)
GO

CREATE TABLE [SubRegion] (
  [SubRegionId] int PRIMARY KEY IDENTITY(1, 1),
  [SubRegionName] nvarchar(255),
  [RegionId] int
)
GO

CREATE TABLE [StudyArea] (
  [StudyAreaId] int PRIMARY KEY IDENTITY(1, 1),
  [StudyAreaName] nvarchar(255),
  [SubRegionId] int
)
GO

CREATE TABLE [Location] (
  [LocationId] int PRIMARY KEY IDENTITY(1, 1),
  [Latitude] float,
  [Longitude] float,
  [StudyAreaId] int
)
GO

CREATE TABLE [FishSurvey] (
  [FishId] int,
  [SurveyIndex] int,
  [length] int,
  [Count] int
)
GO

ALTER TABLE [Fish] ADD FOREIGN KEY ([ScientificNameID]) REFERENCES [ScientificName] ([ScientificNameID])
GO

ALTER TABLE [Fish] ADD FOREIGN KEY ([TrophicID]) REFERENCES [Trophic] ([TrophicID])
GO

ALTER TABLE [ScientificName] ADD FOREIGN KEY ([FamilyNameId]) REFERENCES [FamilyName] ([FamilyNameId])
GO

ALTER TABLE [Survey] ADD FOREIGN KEY ([BatchCodeId]) REFERENCES [BatchCode] ([BatchCodeId])
GO

ALTER TABLE [Survey] ADD FOREIGN KEY ([ManagementId]) REFERENCES [Management] ([ManagementId])
GO

ALTER TABLE [Survey] ADD FOREIGN KEY ([StructureTypeId]) REFERENCES [StructureType] ([StructureTypeId])
GO

ALTER TABLE [Survey] ADD FOREIGN KEY ([LocationId]) REFERENCES [Location] ([LocationId])
GO

ALTER TABLE [SubRegion] ADD FOREIGN KEY ([RegionId]) REFERENCES [Region] ([RegionId])
GO

ALTER TABLE [StudyArea] ADD FOREIGN KEY ([SubRegionId]) REFERENCES [SubRegion] ([SubRegionId])
GO

ALTER TABLE [Location] ADD FOREIGN KEY ([StudyAreaId]) REFERENCES [StudyArea] ([StudyAreaId])
GO

ALTER TABLE [FishSurvey] ADD FOREIGN KEY ([FishId]) REFERENCES [Fish] ([FishId])
GO

ALTER TABLE [FishSurvey] ADD FOREIGN KEY ([SurveyIndex]) REFERENCES [Survey] ([SurveyIndex])
GO
