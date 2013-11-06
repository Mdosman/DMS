using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class DonorStatusMap : EntityTypeConfiguration<DonorStatus>
    {
        public DonorStatusMap()
        {
            // Primary Key
            this.HasKey(t => t.DonorStatusId);

            // Properties
            this.Property(t => t.DonorStatus1)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblDonorStatuses");
            this.Property(t => t.DonorStatusId).HasColumnName("DonorStatusId");
            this.Property(t => t.DonorStatus1).HasColumnName("DonorStatus");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");
        }
    }
}
