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
    
    public partial class Round
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Round()
        {
            this.RoundWinners = new HashSet<RoundWinner>();
        }
    
        public int Id { get; set; }
        public System.DateTime Date { get; set; }
        public short Number { get; set; }
        public string Name { get; set; }
        public int Season { get; set; }
        public string Venue { get; set; }
    
        public virtual RoundResult RoundResult { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RoundWinner> RoundWinners { get; set; }
        public virtual Season RelatedSeason { get; set; }
        public virtual Venue RelatedVenue { get; set; }
    }
}
