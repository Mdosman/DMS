using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class MaritalStatus
    {
        public MaritalStatus()
        {
            this.Donors = new List<Donor>();
        }

        public byte MaritalStatusId { get; set; }
        public string MaritalStatus1 { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ICollection<Donor> Donors { get; set; }
    }
}
