using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace sportiroda
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            label1.Text = String.Join("\n", new Model.sportirodaContext().Versenyzos.Select(x => x.Nev));
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
