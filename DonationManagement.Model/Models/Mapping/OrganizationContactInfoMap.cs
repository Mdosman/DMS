using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class OrganizationContactInfoMap : EntityTypeConfiguration<OrganizationContactInfo>
    {
        public OrganizationContactInfoMap()
        {
            // Primary Key
            this.HasKey(t => t.OrganizationContactInfoId);

            // Properties
            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblOrganizationContactInfos");
            this.Property(t => t.OrganizationContactInfoId).HasColumnName("OrganizationContactInfoId");
            this.Property(t => t.OrganizationId).HasColumnName("OrganizationId");
            this.Property(t => t.ContactInfoId).HasColumnName("ContactInfoId");
            this.Property(t => t.ContactInfoTypeId).HasColumnName("ContactInfoTypeId");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasRequired(t => t.ContactInfo)
                .WithMany(t => t.OrganizationContactInfos)
                .HasForeignKey(d => d.ContactInfoId);
            this.HasRequired(t => t.ContactInfoType)
                .WithMany(t => t.OrganizationContactInfos)
                .HasForeignKey(d => d.ContactInfoTypeId);
            this.HasRequired(t => t.Organization)
                .WithMany(t => t.OrganizationContactInfos)
                .HasForeignKey(d => d.OrganizationId);

        }
    }
}
