using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class AddressType
    {
        public AddressType()
        {
            this.DonorAdresses = new List<DonorAdress>();
            this.OrganizationAddresses = new List<OrganizationAddress>();
        }

        public short AddressTypeId { get; set; }
        public string AddressType1 { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ICollection<DonorAdress> DonorAdresses { get; set; }
        public virtual ICollection<OrganizationAddress> OrganizationAddresses { get; set; }
    }
}
