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
    
    public partial class tblOrganization
    {
        public tblOrganization()
        {
            this.tblBatches = new HashSet<tblBatch>();
            this.tblContributionCategories = new HashSet<tblContributionCategory>();
            this.tblDonors = new HashSet<tblDonor>();
            this.tblHouseholds = new HashSet<tblHousehold>();
            this.tblOrganizationAddresses = new HashSet<tblOrganizationAddress>();
            this.tblOrganizationContactInfos = new HashSet<tblOrganizationContactInfo>();
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
    
        public virtual ICollection<tblBatch> tblBatches { get; set; }
        public virtual ICollection<tblContributionCategory> tblContributionCategories { get; set; }
        public virtual ICollection<tblDonor> tblDonors { get; set; }
        public virtual ICollection<tblHousehold> tblHouseholds { get; set; }
        public virtual ICollection<tblOrganizationAddress> tblOrganizationAddresses { get; set; }
        public virtual ICollection<tblOrganizationContactInfo> tblOrganizationContactInfos { get; set; }
    }
}