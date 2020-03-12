Create Database ReefSurvey; 

Create Table Fish as F {
  FishId int [pk, increment] // auto-increment
  ScientificNameID int [ref: > SN.ScientificNameID]
  TrophicID varchar [ref: > T.TrophicID]
}
Create Table FamilyName as FN {
  FamilyNameId int [pk, increment]
  FamilyName varchar
}
Create Table ScientificName as SN {
  ScientificNameID int [pk, increment]
  ScientificName varchar 
  CommonName varchar
  FamilyNameId int [ref: > FN.FamilyNameId]
}
Create Table Trophic as T {
  TrophicID int [pk]
  Trophic varchar 
}
Create Table Survey as S {
  SurveyIndex int [pk, increment]
  SurveyDate date 
  BatchCodeId int [ref: > BC.BatchCodeId]
  ManagementId int [ref: > MGMT.ManagementId]
  StructureTypeId int [ref: > ST.StructureTypeId]
  LocationId int [ref: > L.LocationId]
}
Create Table BatchCode as BC {
  BatchCodeId int [pk, increment]
  BatchCode varchar
}
Create Table Management as MGMT {
  ManagementId int [pk, increment]
  ManagementName varchar
}
Create Table StructureType as ST {
  StructureTypeId int [pk, increment]
  StructureType varchar
}
Create Table Region as R {
  RegionId int [pk, increment]
  RegionName varchar
}
Create Table SubRegion as SR {
  SubRegionId int [pk, increment]
  SubRegionName varchar
  RegionId int [ref: > R.RegionId]
}
Create Table StudyArea as SA {
  StudyAreaId int [pk, increment]
  StudyAreaName varchar
  SubRegionId int [ref: > SR.SubRegionId]
}
Create Table Location as L {
  LocationId int [pk, increment]
  Latitude double
  Longitude double
  StudyAreaId int [ref: > SA.StudyAreaId]
}
Create Table FishSurvey as FS {
  FishId int [ref: > F.FishId]
  SurveyIndex int [ref: > S.SurveyIndex]
  length int 
  Count int 
}