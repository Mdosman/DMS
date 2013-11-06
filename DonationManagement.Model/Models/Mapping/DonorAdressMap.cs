using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class DonorAdressMap : EntityTypeConfiguration<DonorAdress>
    {
        public DonorAdressMap()
        {
            // Primary Key
            this.HasKey(t => t.DonorAddressId);

            // Properties
            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblDonorAdresses");
            this.Property(t => t.DonorAddressId).HasColumnName("DonorAddressId");
            this.Property(t => t.DonorId).HasColumnName("DonorId");
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
                .WithMany(t => t.DonorAdresses)
                .HasForeignKey(d => d.AddressId);
            this.HasRequired(t => t.AddressType)
                .WithMany(t => t.DonorAdresses)
                .HasForeignKey(d => d.AddressTypeId);
            this.HasRequired(t => t.Donor)
                .WithMany(t => t.DonorAdresses)
                .HasForeignKey(d => d.DonorId);

        }
    }
}
