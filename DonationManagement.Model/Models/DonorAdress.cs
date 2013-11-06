using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class DonorAdress
    {
        public int DonorAddressId { get; set; }
        public int DonorId { get; set; }
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
        public virtual Donor Donor { get; set; }
    }
}
