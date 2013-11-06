using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class Pledge
    {
        public int PledgeId { get; set; }
        public int PledgeCampaignId { get; set; }
        public int DonorId { get; set; }
        public decimal PledgeAmount { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual Donor Donor { get; set; }
        public virtual PledgeCampaign PledgeCampaign { get; set; }
    }
}
