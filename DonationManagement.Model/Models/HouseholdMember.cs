using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class HouseholdMember
    {
        public int HouseholdMemberId { get; set; }
        public int HouseholdId { get; set; }
        public int DonorId { get; set; }
        public bool IsHouseholdHead { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual Donor Donor { get; set; }
        public virtual Household Household { get; set; }
    }
}
