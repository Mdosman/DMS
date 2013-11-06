using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class PledgeCampaignMap : EntityTypeConfiguration<PledgeCampaign>
    {
        public PledgeCampaignMap()
        {
            // Primary Key
            this.HasKey(t => t.PledgeCampaignId);

            // Properties
            this.Property(t => t.PledgeCampaignName)
                .IsRequired()
                .HasMaxLength(150);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblPledgeCampaigns");
            this.Property(t => t.PledgeCampaignId).HasColumnName("PledgeCampaignId");
            this.Property(t => t.PledgeCampaignName).HasColumnName("PledgeCampaignName");
            this.Property(t => t.StartDate).HasColumnName("StartDate");
            this.Property(t => t.EndDate).HasColumnName("EndDate");
            this.Property(t => t.ContributionCategoryId).HasColumnName("ContributionCategoryId");
            this.Property(t => t.TargetAmount).HasColumnName("TargetAmount");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.HasCompleted).HasColumnName("HasCompleted");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasRequired(t => t.ContributionCategory)
                .WithMany(t => t.PledgeCampaigns)
                .HasForeignKey(d => d.ContributionCategoryId);

        }
    }
}
