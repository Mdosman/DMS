//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DonationManagement.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblPaymentType
    {
        public tblPaymentType()
        {
            this.tblContributions = new HashSet<tblContribution>();
        }
    
        public short PaymentTypeId { get; set; }
        public string PaymentType { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public byte[] Version { get; set; }
    
        public virtual ICollection<tblContribution> tblContributions { get; set; }
    }
}
