using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class Household
    {
        public Household()
        {
            this.HouseholdMembers = new List<HouseholdMember>();
        }

        public int HouseholdId { get; set; }
        public string HouseholdName { get; set; }
        public string HouseholdPhone { get; set; }
        public int AddressId { get; set; }
        public bool IsActive { get; set; }
        public int OrganizationId { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual Address Address { get; set; }
        public virtual ICollection<HouseholdMember> HouseholdMembers { get; set; }
        public virtual Organization Organization { get; set; }
    }
}
