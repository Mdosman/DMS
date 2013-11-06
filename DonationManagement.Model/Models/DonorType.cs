using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class DonorType
    {
        public DonorType()
        {
            this.Donors = new List<Donor>();
        }

        public byte DonorTypeId { get; set; }
        public string DonorType1 { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ICollection<Donor> Donors { get; set; }
    }
}
