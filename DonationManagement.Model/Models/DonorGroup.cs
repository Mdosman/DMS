using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class DonorGroup
    {
        public int DonorGroupId { get; set; }
        public int DonorId { get; set; }
        public short DonorGroupTypeId { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual DonorGroupType DonorGroupType { get; set; }
        public virtual Donor Donor { get; set; }
    }
}
