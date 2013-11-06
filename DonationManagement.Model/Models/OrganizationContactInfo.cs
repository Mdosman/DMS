using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class OrganizationContactInfo
    {
        public int OrganizationContactInfoId { get; set; }
        public int OrganizationId { get; set; }
        public int ContactInfoId { get; set; }
        public short ContactInfoTypeId { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ContactInfo ContactInfo { get; set; }
        public virtual ContactInfoType ContactInfoType { get; set; }
        public virtual Organization Organization { get; set; }
    }
}
