using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using DonationManagement.Model.Mapping;

namespace DonationManagement.Model
{
    public partial class DonationManagementContext : DbContext
    {
        static DonationManagementContext()
        {
            Database.SetInitializer<DonationManagementContext>(null);
        }

        public DonationManagementContext()
            : base("Name=DonationManagementContext")
        {
        }

        public DbSet<Address> Addresses { get; set; }
        public DbSet<AddressType> AddressTypes { get; set; }
        public DbSet<Batch> Batches { get; set; }
        public DbSet<ContactInfo> ContactInfos { get; set; }
        public DbSet<ContactInfoType> ContactInfoTypes { get; set; }
        public DbSet<ContributionCategory> ContributionCategories { get; set; }
        public DbSet<Contribution> Contributions { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<DonorAdress> DonorAdresses { get; set; }
        public DbSet<DonorContactInfo> DonorContactInfos { get; set; }
        public DbSet<DonorGroup> DonorGroups { get; set; }
        public DbSet<DonorGroupType> DonorGroupTypes { get; set; }
        public DbSet<Donor> Donors { get; set; }
        public DbSet<DonorStatus> DonorStatuses { get; set; }
        public DbSet<DonorType> DonorTypes { get; set; }
        public DbSet<Gender> Genders { get; set; }
        public DbSet<HouseholdMember> HouseholdMembers { get; set; }
        public DbSet<Household> Households { get; set; }
        public DbSet<MaritalStatus> MaritalStatuses { get; set; }
        public DbSet<OrganizationAddress> OrganizationAddresses { get; set; }
        public DbSet<OrganizationContactInfo> OrganizationContactInfos { get; set; }
        public DbSet<Organization> Organizations { get; set; }
        public DbSet<PaymentType> PaymentTypes { get; set; }
        public DbSet<PledgeCampaign> PledgeCampaigns { get; set; }
        public DbSet<Pledge> Pledges { get; set; }
        public DbSet<StateProvince> StateProvinces { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new AddressMap());
            modelBuilder.Configurations.Add(new AddressTypeMap());
            modelBuilder.Configurations.Add(new BatchMap());
            modelBuilder.Configurations.Add(new ContactInfoMap());
            modelBuilder.Configurations.Add(new ContactInfoTypeMap());
            modelBuilder.Configurations.Add(new ContributionCategoryMap());
            modelBuilder.Configurations.Add(new ContributionMap());
            modelBuilder.Configurations.Add(new CountryMap());
            modelBuilder.Configurations.Add(new DonorAdressMap());
            modelBuilder.Configurations.Add(new DonorContactInfoMap());
            modelBuilder.Configurations.Add(new DonorGroupMap());
            modelBuilder.Configurations.Add(new DonorGroupTypeMap());
            modelBuilder.Configurations.Add(new DonorMap());
            modelBuilder.Configurations.Add(new DonorStatusMap());
            modelBuilder.Configurations.Add(new DonorTypeMap());
            modelBuilder.Configurations.Add(new GenderMap());
            modelBuilder.Configurations.Add(new HouseholdMemberMap());
            modelBuilder.Configurations.Add(new HouseholdMap());
            modelBuilder.Configurations.Add(new MaritalStatusMap());
            modelBuilder.Configurations.Add(new OrganizationAddressMap());
            modelBuilder.Configurations.Add(new OrganizationContactInfoMap());
            modelBuilder.Configurations.Add(new OrganizationMap());
            modelBuilder.Configurations.Add(new PaymentTypeMap());
            modelBuilder.Configurations.Add(new PledgeCampaignMap());
            modelBuilder.Configurations.Add(new PledgeMap());
            modelBuilder.Configurations.Add(new StateProvinceMap());
        }
    }
}
