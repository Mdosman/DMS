using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class PledgeCampaign
    {
        public PledgeCampaign()
        {
            this.Pledges = new List<Pledge>();
        }

        public int PledgeCampaignId { get; set; }
        public string PledgeCampaignName { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public int ContributionCategoryId { get; set; }
        public Nullable<decimal> TargetAmount { get; set; }
        public bool IsActive { get; set; }
        public bool HasCompleted { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ContributionCategory ContributionCategory { get; set; }
        public virtual ICollection<Pledge> Pledges { get; set; }
    }
}
