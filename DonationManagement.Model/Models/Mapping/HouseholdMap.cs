using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class HouseholdMap : EntityTypeConfiguration<Household>
    {
        public HouseholdMap()
        {
            // Primary Key
            this.HasKey(t => t.HouseholdId);

            // Properties
            this.Property(t => t.HouseholdName)
                .IsRequired()
                .HasMaxLength(250);

            this.Property(t => t.HouseholdPhone)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblHouseholds");
            this.Property(t => t.HouseholdId).HasColumnName("HouseholdId");
            this.Property(t => t.HouseholdName).HasColumnName("HouseholdName");
            this.Property(t => t.HouseholdPhone).HasColumnName("HouseholdPhone");
            this.Property(t => t.AddressId).HasColumnName("AddressId");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.OrganizationId).HasColumnName("OrganizationId");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasRequired(t => t.Address)
                .WithMany(t => t.Households)
                .HasForeignKey(d => d.AddressId);
            this.HasRequired(t => t.Organization)
                .WithMany(t => t.Households)
                .HasForeignKey(d => d.OrganizationId);

        }
    }
}
