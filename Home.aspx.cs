using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContactList
{
    public partial class Home : System.Web.UI.Page
    {
        static List<Contact> ContactList = new List<Contact>();

        protected void Page_Load(object sender, EventArgs e)
        {
            nameInput.Focus();

            if (ContactList.Count > 0) 
                UpdateAllContactsList(); UpdateClosestBirthdayList();

        }

        protected void RegisterContact(object sender, EventArgs e)
        {

            string name = nameInput.Text;
            DateTime birthDay = birthDayCalendar.SelectedDate;

            nameInput.Text = "";
            birthDayCalendar.SelectedDate = DateTime.MinValue;

            if (name.Count() < 3 || birthDay == DateTime.MinValue) return;

            Contact ctt = new Contact(name, birthDay);
            System.Diagnostics.Debug.WriteLine(birthDay.ToShortDateString());

            ContactList.Add(ctt);

        }


        protected void UpdateAllContactsList()
        {
            AllContactsRepeater.DataSource = ContactList;
            AllContactsRepeater.DataBind();
        }

        protected void UpdateClosestBirthdayList()
        {
            List<Contact> FilteredList = 
                ContactList.Where(ctt => ctt.DaysLeftToBirthday < 30).ToList();

            ClosestBirthdaysRepeater.DataSource = FilteredList;
            ClosestBirthdaysRepeater.DataBind();

        }
    }
}