using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class DonorMap : EntityTypeConfiguration<Donor>
    {
        public DonorMap()
        {
            // Primary Key
            this.HasKey(t => t.DonorId);

            // Properties
            this.Property(t => t.Description)
                .HasMaxLength(500);

            this.Property(t => t.FirstName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.MiddleName)
                .HasMaxLength(50);

            this.Property(t => t.LastName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Note)
                .HasMaxLength(500);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblDonors");
            this.Property(t => t.DonorId).HasColumnName("DonorId");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.FirstName).HasColumnName("FirstName");
            this.Property(t => t.MiddleName).HasColumnName("MiddleName");
            this.Property(t => t.LastName).HasColumnName("LastName");
            this.Property(t => t.GenderId).HasColumnName("GenderId");
            this.Property(t => t.MaritalStatusId).HasColumnName("MaritalStatusId");
            this.Property(t => t.Note).HasColumnName("Note");
            this.Property(t => t.DonorTypeId).HasColumnName("DonorTypeId");
            this.Property(t => t.DonorStatusId).HasColumnName("DonorStatusId");
            this.Property(t => t.OrganizationId).HasColumnName("OrganizationId");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");

            // Relationships
            this.HasRequired(t => t.DonorStatus)
                .WithMany(t => t.Donors)
                .HasForeignKey(d => d.DonorStatusId);
            this.HasRequired(t => t.DonorType)
                .WithMany(t => t.Donors)
                .HasForeignKey(d => d.DonorTypeId);
            this.HasOptional(t => t.Gender)
                .WithMany(t => t.Donors)
                .HasForeignKey(d => d.GenderId);
            this.HasOptional(t => t.MaritalStatus)
                .WithMany(t => t.Donors)
                .HasForeignKey(d => d.MaritalStatusId);
            this.HasRequired(t => t.Organization)
                .WithMany(t => t.Donors)
                .HasForeignKey(d => d.OrganizationId);

        }
    }
}
