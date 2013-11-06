using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class ContributionCategory
    {
        public ContributionCategory()
        {
            this.Contributions = new List<Contribution>();
            this.PledgeCampaigns = new List<PledgeCampaign>();
        }

        public int ContributionCategoryId { get; set; }
        public string ContributionCategory1 { get; set; }
        public int OrganizationId { get; set; }
        public bool IsDefault { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual Organization Organization { get; set; }
        public virtual ICollection<Contribution> Contributions { get; set; }
        public virtual ICollection<PledgeCampaign> PledgeCampaigns { get; set; }
    }
}
