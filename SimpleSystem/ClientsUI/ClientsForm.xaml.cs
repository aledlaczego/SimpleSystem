using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace SimpleSystem.ClientsUI
{
    /// <summary>
    /// Interaction logic for ClientsForm.xaml
    /// </summary>
    public partial class ClientsForm : Window
    {

        private ClientsFormViewModel viewModel { get; set; }

        public ClientsForm()
        {
            InitializeComponent();
            viewModel = new ClientsFormViewModel();
            ClientsWindow.DataContext = viewModel;
        }

        private void onClick_AddClientBtn(object sender, RoutedEventArgs e)
        {
            viewModel.CreateClient(ClientNameTxtBox.Text);
        }

        private void onClick_DeleteClientBtn(object sender, RoutedEventArgs e)
        {
            var client = (Clients)clientsDataGrid.SelectedItem;
            viewModel.DeleteClient(client.ClientId);
        }
    }
}
