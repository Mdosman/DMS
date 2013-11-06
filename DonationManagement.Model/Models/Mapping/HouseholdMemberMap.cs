using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class HouseholdMemberMap : EntityTypeConfiguration<HouseholdMember>
    {
        public HouseholdMemberMap()
        {
            // Primary Key
            this.HasKey(t => t.HouseholdMemberId);

            // Properties
            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblHouseholdMembers");
            this.Property(t => t.HouseholdMemberId).HasColumnName("HouseholdMemberId");
            this.Property(t => t.HouseholdId).HasColumnName("HouseholdId");
            this.Property(t => t.DonorId).HasColumnName("DonorId");
            this.Property(t => t.IsHouseholdHead).HasColumnName("IsHouseholdHead");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasRequired(t => t.Donor)
                .WithMany(t => t.HouseholdMembers)
                .HasForeignKey(d => d.DonorId);
            this.HasRequired(t => t.Household)
                .WithMany(t => t.HouseholdMembers)
                .HasForeignKey(d => d.HouseholdId);

        }
    }
}
