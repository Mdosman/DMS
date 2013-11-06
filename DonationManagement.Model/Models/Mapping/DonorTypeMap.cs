using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class DonorTypeMap : EntityTypeConfiguration<DonorType>
    {
        public DonorTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.DonorTypeId);

            // Properties
            this.Property(t => t.DonorType1)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblDonorTypes");
            this.Property(t => t.DonorTypeId).HasColumnName("DonorTypeId");
            this.Property(t => t.DonorType1).HasColumnName("DonorType");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");
        }
    }
}
