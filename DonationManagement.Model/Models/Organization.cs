using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class Organization
    {
        public Organization()
        {
            this.Batches = new List<Batch>();
            this.ContributionCategories = new List<ContributionCategory>();
            this.Donors = new List<Donor>();
            this.Households = new List<Household>();
            this.OrganizationAddresses = new List<OrganizationAddress>();
            this.OrganizationContactInfos = new List<OrganizationContactInfo>();
        }

        public int OrganizationId { get; set; }
        public string OrganizationName { get; set; }
        public string Abbreviation { get; set; }
        public string FederalTaxId { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ICollection<Batch> Batches { get; set; }
        public virtual ICollection<ContributionCategory> ContributionCategories { get; set; }
        public virtual ICollection<Donor> Donors { get; set; }
        public virtual ICollection<Household> Households { get; set; }
        public virtual ICollection<OrganizationAddress> OrganizationAddresses { get; set; }
        public virtual ICollection<OrganizationContactInfo> OrganizationContactInfos { get; set; }
    }
}
