using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class ContactInfoMap : EntityTypeConfiguration<ContactInfo>
    {
        public ContactInfoMap()
        {
            // Primary Key
            this.HasKey(t => t.ContactInfoId);

            // Properties
            this.Property(t => t.EmailAddress)
                .HasMaxLength(250);

            this.Property(t => t.Phone)
                .HasMaxLength(50);

            this.Property(t => t.WirelessPhone)
                .HasMaxLength(50);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblContactInfos");
            this.Property(t => t.ContactInfoId).HasColumnName("ContactInfoId");
            this.Property(t => t.EmailAddress).HasColumnName("EmailAddress");
            this.Property(t => t.Phone).HasColumnName("Phone");
            this.Property(t => t.WirelessPhone).HasColumnName("WirelessPhone");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");
        }
    }
}
