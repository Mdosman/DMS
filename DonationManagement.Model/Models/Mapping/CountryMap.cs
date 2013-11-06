using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DonationManagement.Model.Mapping
{
    public class CountryMap : EntityTypeConfiguration<Country>
    {
        public CountryMap()
        {
            // Primary Key
            this.HasKey(t => t.CountryId);

            // Properties
            this.Property(t => t.Country1)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.ISO2)
                .IsFixedLength()
                .HasMaxLength(10);

            this.Property(t => t.ISO3)
                .IsFixedLength()
                .HasMaxLength(10);

            this.Property(t => t.Version)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("tblCountries");
            this.Property(t => t.CountryId).HasColumnName("CountryId");
            this.Property(t => t.Country1).HasColumnName("Country");
            this.Property(t => t.ISO2).HasColumnName("ISO2");
            this.Property(t => t.ISO3).HasColumnName("ISO3");
            this.Property(t => t.IsActive).HasColumnName("IsActive");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.CreatedBy).HasColumnName("CreatedBy");
            this.Property(t => t.UpdatedOn).HasColumnName("UpdatedOn");
            this.Property(t => t.UpdatedBy).HasColumnName("UpdatedBy");
            this.Property(t => t.Version).HasColumnName("Version");
        }
    }
}
