using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class BatchMap : EntityTypeConfiguration<Batch>
    {
        public BatchMap()
        {
            // Primary Key
            this.HasKey(t => t.BatchId);

            // Properties
            this.Property(t => t.BatchName)
                .HasMaxLength(150);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblBatches");
            this.Property(t => t.BatchId).HasColumnName("BatchId");
            this.Property(t => t.BatchName).HasColumnName("BatchName");
            this.Property(t => t.OrganizationId).HasColumnName("OrganizationId");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasRequired(t => t.Organization)
                .WithMany(t => t.Batches)
                .HasForeignKey(d => d.OrganizationId);

        }
    }
}
