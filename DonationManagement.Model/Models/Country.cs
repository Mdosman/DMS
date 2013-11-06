using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class Country
    {
        public Country()
        {
            this.StateProvinces = new List<StateProvince>();
        }

        public int CountryId { get; set; }
        public string Country1 { get; set; }
        public string ISO2 { get; set; }
        public string ISO3 { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ICollection<StateProvince> StateProvinces { get; set; }
    }
}
