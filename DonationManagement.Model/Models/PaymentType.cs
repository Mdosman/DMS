using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class PaymentType
    {
        public PaymentType()
        {
            this.Contributions = new List<Contribution>();
        }

        public short PaymentTypeId { get; set; }
        public string PaymentType1 { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ICollection<Contribution> Contributions { get; set; }
    }
}
