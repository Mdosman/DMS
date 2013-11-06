using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class Address
    {
        public Address()
        {
            this.DonorAdresses = new List<DonorAdress>();
            this.Households = new List<Household>();
            this.OrganizationAddresses = new List<OrganizationAddress>();
        }

        public int AddressId { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public Nullable<int> StateProvinceId { get; set; }
        public string PostalCode { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual StateProvince StateProvince { get; set; }
        public virtual ICollection<DonorAdress> DonorAdresses { get; set; }
        public virtual ICollection<Household> Households { get; set; }
        public virtual ICollection<OrganizationAddress> OrganizationAddresses { get; set; }
    }
}
