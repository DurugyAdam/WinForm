using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SportIroda
{
    public partial class Versenyek : Form
    {
        public Versenyek()
        {
            InitializeComponent();
        }

        private void Versenyek_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'sportirodaDataSet1.tipus' table. You can move, or remove it, as needed.
            this.tipusTableAdapter.Fill(this.sportirodaDataSet1.tipus);
            // TODO: This line of code loads data into the 'sportirodaDataSet.Versenyek' table. You can move, or remove it, as needed.
            this.versenyekTableAdapter.Fill(this.sportirodaDataSet.Versenyek);
            // TODO: This line of code loads data into the 'sportirodaDataSet.verseny' table. You can move, or remove it, as needed.
            this.versenyTableAdapter.Fill(this.sportirodaDataSet.verseny);

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (numericUpDown2.Value != 0) {
                bindingSourceVersenyek.Filter = $"nev='{comboBox1.SelectedValue}' AND nevezesi_dij > '{numericUpDown1.Value}' AND nevezesi_dij < '{numericUpDown2.Value}'";
            }
            else {
                bindingSourceVersenyek.Filter = $"nev='{comboBox1.SelectedValue}'";
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            bindingSourceVersenyek.Filter = "";
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
