using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class ContactInfoType
    {
        public ContactInfoType()
        {
            this.DonorContactInfos = new List<DonorContactInfo>();
            this.OrganizationContactInfos = new List<OrganizationContactInfo>();
        }

        public short ContactInfoTypeId { get; set; }
        public string ContactInfoType1 { get; set; }
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
