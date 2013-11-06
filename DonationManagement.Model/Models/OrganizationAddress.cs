using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class OrganizationAddress
    {
        public int OrganizationAddressId { get; set; }
        public int OrganizationId { get; set; }
        public int AddressId { get; set; }
        public short AddressTypeId { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual Address Address { get; set; }
        public virtual AddressType AddressType { get; set; }
        public virtual Organization Organization { get; set; }
    }
}
