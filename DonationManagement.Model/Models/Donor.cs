using System;
using System.Collections.Generic;

namespace DonationManagement.Model
{
    public partial class Donor
    {
        public Donor()
        {
            this.Contributions = new List<Contribution>();
            this.DonorAdresses = new List<DonorAdress>();
            this.DonorContactInfos = new List<DonorContactInfo>();
            this.DonorGroups = new List<DonorGroup>();
            this.HouseholdMembers = new List<HouseholdMember>();
            this.Pledges = new List<Pledge>();
        }

        public int DonorId { get; set; }
        public string Description { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public Nullable<byte> GenderId { get; set; }
        public Nullable<byte> MaritalStatusId { get; set; }
        public string Note { get; set; }
        public byte DonorTypeId { get; set; }
        public byte DonorStatusId { get; set; }
        public int OrganizationId { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
        public virtual ICollection<Contribution> Contributions { get; set; }
        public virtual ICollection<DonorAdress> DonorAdresses { get; set; }
        public virtual ICollection<DonorContactInfo> DonorContactInfos { get; set; }
        public virtual ICollection<DonorGroup> DonorGroups { get; set; }
        public virtual DonorStatus DonorStatus { get; set; }
        public virtual DonorType DonorType { get; set; }
        public virtual Gender Gender { get; set; }
        public virtual MaritalStatus MaritalStatus { get; set; }
        public virtual Organization Organization { get; set; }
        public virtual ICollection<HouseholdMember> HouseholdMembers { get; set; }
        public virtual ICollection<Pledge> Pledges { get; set; }
    }
}
