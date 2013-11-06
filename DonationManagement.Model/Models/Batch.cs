using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class Batch
    {
        public Batch()
        {
            this.Contributions = new List<Contribution>();
        }

        public int BatchId { get; set; }
        public string BatchName { get; set; }
        public int OrganizationId { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual Organization Organization { get; set; }
        public virtual ICollection<Contribution> Contributions { get; set; }
    }
}
