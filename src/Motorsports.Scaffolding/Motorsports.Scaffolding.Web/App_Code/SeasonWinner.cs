//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Motorsports.Scaffolding.Web.App_Code
{
    using System;
    using System.Collections.Generic;
    
    public partial class SeasonWinner
    {
        public int Id { get; set; }
        public int Season { get; set; }
        public int Participant { get; set; }
    
        public virtual Participant RelatedParticipant { get; set; }
        public virtual Season RelatedSeason { get; set; }
    }
}
