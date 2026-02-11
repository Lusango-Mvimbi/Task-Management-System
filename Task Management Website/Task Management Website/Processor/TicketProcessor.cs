using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Task_Management_Website.Repositories;
using Task_Management_Website.assets.Model;


namespace Task_Management_Website.Processor
{
    public class TicketProcessor
    {

        public static async Task<bool> processTicketCreation(TicketInfo ticket)
        {
            return await TicketRepoository.CreateTicket(ticket);
        }

        public static async Task<bool> processTicketUpdate(TicketInfo ticket)
        {
            return await TicketRepoository.UpdateTicket(ticket);
        }

        public static async Task<TicketInfo> processTicketRetrival(int id)
        {
            String jsonContent = await TicketRepoository.RetrieveTicket(id);
            jsonContent = jsonContent.TrimStart('{');
            jsonContent = jsonContent.TrimEnd('}');
            String[] split = jsonContent.Split(',');

            String[] ticketContent = new String[13];

            int count = 0;

            foreach (string value in split)
            {
                String val = value.Split(':')[1];
                val = val.TrimStart('"');
                val = val.TrimEnd('"');
                ticketContent[count] = val;
                count += 1;
            }


            var retTicket = new TicketInfo()
            {
                ID = Convert.ToInt32(ticketContent[0]),
                Title = ticketContent[1],
                Priority_level = ticketContent[2],
                Category = ticketContent[3],
                Description = ticketContent[4],
                Created_By = ticketContent[5],
                Assigned_To = ticketContent[6],
                Assigned_By = ticketContent[7],
                Status = ticketContent[8],
                Veiwed = ticketContent[9],
                Date_Created = Convert.ToDateTime(UtiltyMethods.jsonDateFix(ticketContent[10])),
                Date_Deadline = Convert.ToDateTime(UtiltyMethods.jsonDateFix(ticketContent[11])),
                Date_Completed = Convert.ToDateTime(UtiltyMethods.jsonDateFix(ticketContent[12])),
            };

            return retTicket;
        }

        public static async Task<List<TicketInfo>> processAllTicketRetrival()
        {
            String jsonContent = await TicketRepoository.RetrieveAllTickets();

            

            jsonContent = jsonContent.TrimStart('[');
            jsonContent = jsonContent.TrimEnd(']');
            string[] tokens = jsonContent.Split(new[] { "},{" }, StringSplitOptions.None);
            String[] ticketContent = new String[20];
            int count = 0;
            String st = "";
            var ticketList = new List<TicketInfo>();
            foreach (string s in tokens)
            {
                String val = s;
                String[] splitVal = val.Split(',');
                foreach (String v in splitVal)
                {
                    String strValue = v.Split(':')[1];

                    strValue = strValue.TrimStart('"');
                    strValue = strValue.TrimEnd('"');
                    st += strValue + ",";
                }
            }

            int len = st.Split(',').Count();


            count = 0;
            while (count < len - 1)
            {
                var retTicket = new TicketInfo();


                retTicket.ID = Convert.ToInt32(st.Split(',')[count]);
                count += 1;
                retTicket.Title = st.Split(',')[count];
                count += 1;
                retTicket.Priority_level = st.Split(',')[count];
                count += 1;
                retTicket.Category = st.Split(',')[count];
                count += 1;
                retTicket.Description = st.Split(',')[count];
                count += 1;
                retTicket.Created_By = st.Split(',')[count];
                count += 1;
                retTicket.Assigned_To = st.Split(',')[count];
                count += 1;
                retTicket.Assigned_By = st.Split(',')[count];
                count += 1;
                retTicket.Status = st.Split(',')[count];
                count += 1;
                retTicket.Veiwed = st.Split(',')[count];
                count += 1;
                retTicket.Date_Created = Convert.ToDateTime(UtiltyMethods.jsonDateFix(st.Split(',')[count]));
                count += 1;
                retTicket.Date_Deadline = Convert.ToDateTime(UtiltyMethods.jsonDateFix(st.Split(',')[count]));
                count += 1;
                retTicket.Date_Completed = Convert.ToDateTime(UtiltyMethods.jsonDateFix(st.Split(',')[count]));
                count += 1;

                ticketList.Add(retTicket);

            }


            

            return ticketList;
        }


        public async Task<bool> RetrieveTicket()
        {
            var ticket = await TicketProcessor.processTicketRetrival(1);

            var ticketModel = new TicketInfo
            {
                Title = ticket.Title,
                Assigned_By = ticket.Assigned_By,
                Assigned_To = ticket.Assigned_To,
                Category = ticket.Category,
                Created_By = ticket.Created_By,
                Date_Created = ticket.Date_Created,
                Date_Completed = ticket.Date_Completed,
                Date_Deadline = ticket.Date_Deadline,
                Description = ticket.Description,
                Priority_level = ticket.Priority_level,
                Status = ticket.Status,
                Veiwed = ticket.Veiwed,
            };



            return true;
        }


    }
}