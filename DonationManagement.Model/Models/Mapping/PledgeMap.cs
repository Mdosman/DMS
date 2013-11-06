using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class PledgeMap : EntityTypeConfiguration<Pledge>
    {
        public PledgeMap()
        {
            // Primary Key
            this.HasKey(t => t.PledgeId);

            // Properties
            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblPledges");
            this.Property(t => t.PledgeId).HasColumnName("PledgeId");
            this.Property(t => t.PledgeCampaignId).HasColumnName("PledgeCampaignId");
            this.Property(t => t.DonorId).HasColumnName("DonorId");
            this.Property(t => t.PledgeAmount).HasColumnName("PledgeAmount");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasRequired(t => t.Donor)
                .WithMany(t => t.Pledges)
                .HasForeignKey(d => d.DonorId);
            this.HasRequired(t => t.PledgeCampaign)
                .WithMany(t => t.Pledges)
                .HasForeignKey(d => d.PledgeCampaignId);

        }
    }
}
