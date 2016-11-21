using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace SimpleSystem.ClientsUI
{
    class ClientsFormViewModel : INotifyPropertyChanged
    {

        private List<Clients> clientsList;

        public event PropertyChangedEventHandler PropertyChanged;

        public ClientsFormViewModel()
        {
            clientsList = DataAccessor.GetAllClients();
        }
        
        public List<Clients> ClientsList
        {
            get { return clientsList; }
            set
            {
                clientsList = value;
                OnPropertyChanged("ClientsList");
            }
        }    

        private void refreshClientsList()
        {
            ClientsList = DataAccessor.GetAllClients();
        }

        public bool CreateClient(string name)
        {
            bool saveDone = DataAccessor.InsertClient(name);
            if (saveDone)
                refreshClientsList();
            return saveDone;
        }

        public bool DeleteClient(int id)
        {
            bool deleteDone = DataAccessor.DeleteClient(id);
            if (deleteDone)
                refreshClientsList();
            return deleteDone;
        }

        protected void OnPropertyChanged(string name)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
                
        }
    }
}
