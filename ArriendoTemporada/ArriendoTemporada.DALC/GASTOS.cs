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
    
    public partial class GASTOS
    {
        public string TIPO_GASTO { get; set; }
        public int VALOR { get; set; }
        public System.DateTime FECHA { get; set; }
        public int DPTO_ID_DPTO { get; set; }
    
        public virtual DPTO DPTO { get; set; }
    }
}
