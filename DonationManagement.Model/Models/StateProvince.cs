using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class StateProvince
    {
        public StateProvince()
        {
            this.Addresses = new List<Address>();
        }

        public int StateProvinceId { get; set; }
        public string StateProvinceName { get; set; }
        public string StateProvicenCode { get; set; }
        public int CountryId { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ICollection<Address> Addresses { get; set; }
        public virtual Country Country { get; set; }
    }
}
