﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AgriSibo.WebApi.EF
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class AgriSiboEntities : DbContext
    {
        public AgriSiboEntities()
            : base("name=AgriSiboEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ApiSecurity> ApiSecurities { get; set; }
        public virtual DbSet<Farmer> Farmers { get; set; }
        public virtual DbSet<FarmersCrop> FarmersCrops { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<Farm> Farms { get; set; }
        public virtual DbSet<FarmCrop> FarmCrops { get; set; }
    }
}
