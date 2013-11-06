using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class ContactInfo
    {
        public ContactInfo()
        {
            this.DonorContactInfos = new List<DonorContactInfo>();
            this.OrganizationContactInfos = new List<OrganizationContactInfo>();
        }

        public int ContactInfoId { get; set; }
        public string EmailAddress { get; set; }
        public string Phone { get; set; }
        public string WirelessPhone { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ICollection<DonorContactInfo> DonorContactInfos { get; set; }
        public virtual ICollection<OrganizationContactInfo> OrganizationContactInfos { get; set; }
    }
}
