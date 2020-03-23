﻿using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ReefSurvey
{
    //public class BloggingContext : DbContext
    //{
    //    public DbSet<Blog> Blogs { get; set; }
    //    public DbSet<Post> Posts { get; set; }

    //    protected override void OnConfiguring(DbContextOptionsBuilder options)
    //        => options.UseSqlite("Data Source=blogging.db");
    //}
    public class ReefSurveyContext : DbContext
    {
        public DbSet<Fish> Fishs { get; set; }
        public DbSet<FamilyName> FamilyNames { get; set; }
        public DbSet<ScientificName> ScientificNames { get; set; }

        public DbSet<Trophic> Trophics { get; set; }

        public DbSet<Survey> Surveys { get; set; }

        public DbSet<BatchCode> BatchCodes { get; set; }

        public DbSet<Management> Managements { get; set; }

        public DbSet<StructureType> StructureTypes { get; set; }

        public DbSet<Region> Regions { get; set; }

        public DbSet<SubRegion> SubRegions { get; set; }

        public DbSet<StudyArea> StudyAreas { get; set; }

        public DbSet<Location> Locations { get; set; }

        public DbSet<FishSurvey> FishSurveys { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlite("Data Source=ReefSurvey2.db");
        }
                  
    }
    public class Fish
    {
        public int FishId { get; set; }
        public string ScientificNameId { get; set; }
        public int TrophicId { get; set; }
    }

    public class FamilyName
    {
        public int FamilyNameId { get; set; }
        public string Name { get; set; }
    }

    public class ScientificName
    {
        public int ScientificNameId { get; set; }
        public string Name { get; set; }
        public string CommonName { get; set; }
        public int FamilyNameId { get; set; }

    }

    public class Trophic
    {
        public int TrophicId { get; set; }
        public string Value { get; set; }
    }

    public class Survey
    {
        public int SurveyId { get; set; }
        public string SurveyDate { get; set; }
        public int BatchCodeId { get; set; }
        public int ManagementId { get; set; }
        public int StructureTypeId { get; set; }
        public int LocationId { get; set; }
    }

    public class BatchCode
    {
        public int BathCodeId { get; set; }
        public string Name { get; set; }
    }
    public class Management
    {
        public int ManagementId { get; set; }
        public string Name { get; set; }
    }

    public class StructureType
    {
        public int StructureTypeId { get; set; }
        public string Name { get; set; }
    }

    public class Region
    {
        public int RegionId { get; set; }
        public string RegionName { get; set; }
    }

    public class SubRegion
    {
        public int SubRegionId { get; set; }
        public string SubRegionName { get; set; }
        public int RegionId { get; set; }
    }

    public class StudyArea
    {
        public int StudyAreaId { get; set; }
        public string StudyAreaName { get; set; }
        public int SubRegionId { get; set; }
    }

    public class Location
    {
        public int LocationId { get; set; }
        public float Lat { get; set; }
        public float Long { get; set; }
        public int StudyAreaId { get; set; }
    }

    public class FishSurvey
    {
        public int FishId { get; set; }
        public int SurveyId { get; set; }
        public int Length { get; set; }
        public int count { get; set; }
    }






}