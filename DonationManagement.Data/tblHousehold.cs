//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DonationManagement.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblHousehold
    {
        public tblHousehold()
        {
            this.tblHouseholdMembers = new HashSet<tblHouseholdMember>();
        }
    
        public int HouseholdId { get; set; }
        public string HouseholdName { get; set; }
        public string HouseholdPhone { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
    
        public virtual tblAddress tblAddress { get; set; }
        public virtual ICollection<tblHouseholdMember> tblHouseholdMembers { get; set; }
        public virtual tblOrganization tblOrganization { get; set; }
    }
}
