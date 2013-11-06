using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class OrganizationAddressMap : EntityTypeConfiguration<OrganizationAddress>
    {
        public OrganizationAddressMap()
        {
            // Primary Key
            this.HasKey(t => t.OrganizationAddressId);

            // Properties
            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblOrganizationAddresses");
            this.Property(t => t.OrganizationAddressId).HasColumnName("OrganizationAddressId");
            this.Property(t => t.OrganizationId).HasColumnName("OrganizationId");
            this.Property(t => t.AddressId).HasColumnName("AddressId");
            this.Property(t => t.AddressTypeId).HasColumnName("AddressTypeId");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasRequired(t => t.Address)
                .WithMany(t => t.OrganizationAddresses)
                .HasForeignKey(d => d.AddressId);
            this.HasRequired(t => t.AddressType)
                .WithMany(t => t.OrganizationAddresses)
                .HasForeignKey(d => d.AddressTypeId);
            this.HasRequired(t => t.Organization)
                .WithMany(t => t.OrganizationAddresses)
                .HasForeignKey(d => d.OrganizationId);

        }
    }
}
