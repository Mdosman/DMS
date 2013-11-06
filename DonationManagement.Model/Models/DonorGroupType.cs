using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class DonorGroupType
    {
        public DonorGroupType()
        {
            this.DonorGroups = new List<DonorGroup>();
        }

        public short DonorGroupTypeId { get; set; }
        public string DonorGroupType1 { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ICollection<DonorGroup> DonorGroups { get; set; }
    }
}
