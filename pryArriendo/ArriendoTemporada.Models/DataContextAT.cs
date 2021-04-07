using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace ArriendoTemporada.Models
{
   public class DataContextAT : DbContext
    {
        public DataContextAT(DbContextOptions<DataContextAT> options) : base(options)
        { }
    }
}
