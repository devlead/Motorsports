﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Motorsports.Scaffolding.Web.App_Code
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MotorsportsEntities : DbContext
    {
        public MotorsportsEntities()
            : base("name=MotorsportsEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Country> Countries { get; set; }
        public DbSet<Participant> Participants { get; set; }
        public DbSet<Round> Rounds { get; set; }
        public DbSet<RoundResult> RoundResults { get; set; }
        public DbSet<RoundWinner> RoundWinners { get; set; }
        public DbSet<Season> Seasons { get; set; }
        public DbSet<SeasonWinner> SeasonWinners { get; set; }
        public DbSet<Sport> Sports { get; set; }
        public DbSet<Status> Status { get; set; }
        public DbSet<Team> Teams { get; set; }
        public DbSet<Venue> Venues { get; set; }
    }
}
