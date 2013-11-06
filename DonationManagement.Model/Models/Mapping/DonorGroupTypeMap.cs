using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class DonorGroupTypeMap : EntityTypeConfiguration<DonorGroupType>
    {
        public DonorGroupTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.DonorGroupTypeId);

            // Properties
            this.Property(t => t.DonorGroupType1)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblDonorGroupTypes");
            this.Property(t => t.DonorGroupTypeId).HasColumnName("DonorGroupTypeId");
            this.Property(t => t.DonorGroupType1).HasColumnName("DonorGroupType");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");
        }
    }
}
