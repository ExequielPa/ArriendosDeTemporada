using System;
using System.Collections.Generic;
using System.Text;

namespace ArriendoTemporada.ViewModels
{
     public class EmailSettings
    {
        public int MailPort { get; set; }
        public string MailServer { get; set; }
        public string SenderName { get; set; }
        public string Sender { get; set; }
        public string Password { get; set; }

    }
}
