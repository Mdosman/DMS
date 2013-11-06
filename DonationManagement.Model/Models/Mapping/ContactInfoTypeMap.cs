using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class ContactInfoTypeMap : EntityTypeConfiguration<ContactInfoType>
    {
        public ContactInfoTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.ContactInfoTypeId);

            // Properties
            this.Property(t => t.ContactInfoType1)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblContactInfoTypes");
            this.Property(t => t.ContactInfoTypeId).HasColumnName("ContactInfoTypeId");
            this.Property(t => t.ContactInfoType1).HasColumnName("ContactInfoType");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");
        }
    }
}
