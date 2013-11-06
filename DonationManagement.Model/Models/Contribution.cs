using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class Contribution
    {
        public int ContributionId { get; set; }
        public Nullable<int> BatchId { get; set; }
        public Nullable<int> DonorId { get; set; }
        public int ContributionCategoryId { get; set; }
        public System.DateTime ContributionDate { get; set; }
        public short PaymentTypeId { get; set; }
        public decimal Contribution1 { get; set; }
        public string Note { get; set; }
        public string Custom1 { get; set; }
        public string Custom2 { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual Batch Batch { get; set; }
        public virtual ContributionCategory ContributionCategory { get; set; }
        public virtual Donor Donor { get; set; }
        public virtual PaymentType PaymentType { get; set; }
    }
}
