using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace SportIroda
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'sportirodaDataSet.tipus' table. You can move, or remove it, as needed.
            this.tipusTableAdapter.Fill(this.sportirodaDataSet.tipus);
            // TODO: This line of code loads data into the 'sportirodaDataSet.OsszesAdat' table. You can move, or remove it, as needed.
            this.osszesAdatTableAdapter.Fill(this.sportirodaDataSet.OsszesAdat);
            // TODO: This line of code loads data into the 'sportirodaDataSet.OsszesAdat' table. You can move, or remove it, as needed.
            this.osszesAdatTableAdapter.Fill(this.sportirodaDataSet.OsszesAdat);

        }
        private void button1_Click(object sender, EventArgs e) {
            if (numericUpDown2.Value != 0) {
                osszesAdatBindingSource.Filter = $"nev='{comboBox1.SelectedValue}' AND nevezesi_dij > '{numericUpDown1.Value}' AND nevezesi_dij < '{numericUpDown2.Value}'";

            }
            else {
                osszesAdatBindingSource.Filter = $"nev='{comboBox1.SelectedValue}'";
            }
        }

        private void button2_Click(object sender, EventArgs e) {
            osszesAdatBindingSource.Filter = "";
        }

        private void button3_Click(object sender, EventArgs e) {
            if (folderBrowserDialog1.ShowDialog() != DialogResult.OK) {
                return;
            }
            string fileName = Path.Combine(
                folderBrowserDialog1.SelectedPath,
                $"sportiroda_'+ {comboBox1.SelectedValue} + '_' + {numericUpDown1.Value} + '_' + {numericUpDown2.Value} + '_DateTime.Now:yyyy-MM-dd}.csv");
            File.WriteAllLines(fileName,
                sportirodaDataSet.OsszesAdat.Select(x => String.Join(";", x.ItemArray))
                );
            MessageBox.Show("Adat Export Sikeres");
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void tableLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
