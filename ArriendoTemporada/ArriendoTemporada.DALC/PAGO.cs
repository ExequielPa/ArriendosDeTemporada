//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ArriendoTemporada.DALC
{
    using System;
    using System.Collections.Generic;
    
    public partial class PAGO
    {
        public string ID_PAGO { get; set; }
        public int MONTO { get; set; }
        public System.DateTime FECHA_PAGO { get; set; }
        public int RESERVA_ID_RESERVA { get; set; }
        public string TIPO_PAGO { get; set; }
        public decimal TRANSBANK_ID_TRANSBANK { get; set; }
    
        public virtual RESERVA RESERVA { get; set; }
        public virtual TRANSBANK TRANSBANK { get; set; }
    }
}
