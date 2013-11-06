using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class DonorGroupMap : EntityTypeConfiguration<DonorGroup>
    {
        public DonorGroupMap()
        {
            // Primary Key
            this.HasKey(t => t.DonorGroupId);

            // Properties
            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblDonorGroups");
            this.Property(t => t.DonorGroupId).HasColumnName("DonorGroupId");
            this.Property(t => t.DonorId).HasColumnName("DonorId");
            this.Property(t => t.DonorGroupTypeId).HasColumnName("DonorGroupTypeId");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasRequired(t => t.DonorGroupType)
                .WithMany(t => t.DonorGroups)
                .HasForeignKey(d => d.DonorGroupTypeId);
            this.HasRequired(t => t.Donor)
                .WithMany(t => t.DonorGroups)
                .HasForeignKey(d => d.DonorId);

        }
    }
}
