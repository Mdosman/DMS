using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class ContributionCategoryMap : EntityTypeConfiguration<ContributionCategory>
    {
        public ContributionCategoryMap()
        {
            // Primary Key
            this.HasKey(t => t.ContributionCategoryId);

            // Properties
            this.Property(t => t.ContributionCategory1)
                .IsRequired()
                .HasMaxLength(250);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblContributionCategories");
            this.Property(t => t.ContributionCategoryId).HasColumnName("ContributionCategoryId");
            this.Property(t => t.ContributionCategory1).HasColumnName("ContributionCategory");
            this.Property(t => t.OrganizationId).HasColumnName("OrganizationId");
            this.Property(t => t.IsDefault).HasColumnName("IsDefault");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasRequired(t => t.Organization)
                .WithMany(t => t.ContributionCategories)
                .HasForeignKey(d => d.OrganizationId);

        }
    }
}
