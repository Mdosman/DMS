using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class ContributionMap : EntityTypeConfiguration<Contribution>
    {
        public ContributionMap()
        {
            // Primary Key
            this.HasKey(t => t.ContributionId);

            // Properties
            this.Property(t => t.Note)
                .HasMaxLength(500);

            this.Property(t => t.Custom1)
                .HasMaxLength(50);

            this.Property(t => t.Custom2)
                .HasMaxLength(50);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblContributions");
            this.Property(t => t.ContributionId).HasColumnName("ContributionId");
            this.Property(t => t.BatchId).HasColumnName("BatchId");
            this.Property(t => t.DonorId).HasColumnName("DonorId");
            this.Property(t => t.ContributionCategoryId).HasColumnName("ContributionCategoryId");
            this.Property(t => t.ContributionDate).HasColumnName("ContributionDate");
            this.Property(t => t.PaymentTypeId).HasColumnName("PaymentTypeId");
            this.Property(t => t.Contribution1).HasColumnName("Contribution");
            this.Property(t => t.Note).HasColumnName("Note");
            this.Property(t => t.Custom1).HasColumnName("Custom1");
            this.Property(t => t.Custom2).HasColumnName("Custom2");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasOptional(t => t.Batch)
                .WithMany(t => t.Contributions)
                .HasForeignKey(d => d.BatchId);
            this.HasRequired(t => t.ContributionCategory)
                .WithMany(t => t.Contributions)
                .HasForeignKey(d => d.ContributionCategoryId);
            this.HasOptional(t => t.Donor)
                .WithMany(t => t.Contributions)
                .HasForeignKey(d => d.DonorId);
            this.HasRequired(t => t.PaymentType)
                .WithMany(t => t.Contributions)
                .HasForeignKey(d => d.PaymentTypeId);

        }
    }
}
