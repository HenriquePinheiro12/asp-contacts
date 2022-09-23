using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ContactList
{
    public class Contact
    {
        public Contact (string name, DateTime birthday)
        {
            Name = name;
            Birthday = birthday;
        }

        public string Name { get; set; }
        public DateTime Birthday { get; set; }

        public string ShortDateString { get => Birthday.ToShortDateString(); }

        public DateTime NextBirthdayDate 
        {
            get =>  
                Birthday.DayOfYear > DateTime.Now.DayOfYear ?
                    new DateTime(DateTime.Now.Year, Birthday.Month, Birthday.Day) :
                    new DateTime(DateTime.Now.Year + 1, Birthday.Month, Birthday.Day);
        }

        public string NextBirthDayString { get => NextBirthdayDate.ToShortDateString(); }


        public int DaysLeftToBirthday { get => NextBirthdayDate.Subtract(DateTime.Now).Days; }

        public int NextAge { get => NextBirthdayDate.Year - Birthday.Year; } 
    }

}