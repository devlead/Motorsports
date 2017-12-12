//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Participant
    {
        public Participant()
        {
            this.RoundWinners = new HashSet<RoundWinner>();
            this.SeasonWinners = new HashSet<SeasonWinner>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Country { get; set; }
    
        public virtual Country RelatedCountry { get; set; }
        public virtual ICollection<RoundWinner> RoundWinners { get; set; }
        public virtual ICollection<SeasonWinner> SeasonWinners { get; set; }
    }
}
