
namespace SportIroda
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.osszesAdatBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.bindingSourceSportIroda = new System.Windows.Forms.BindingSource(this.components);
            this.sportirodaDataSet = new SportIroda.sportirodaDataSet();
            this.sportirodaDataSetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.osszesAdatTableAdapter = new SportIroda.sportirodaDataSetTableAdapters.OsszesAdatTableAdapter();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.nevezesidDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nevDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.szuldatumDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nemDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nev = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.datumDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kezdesidoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nevezesidijDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.szintidoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.button1 = new System.Windows.Forms.Button();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.tipusBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.numericUpDown2 = new System.Windows.Forms.NumericUpDown();
            this.tipusTableAdapter = new SportIroda.sportirodaDataSetTableAdapters.tipusTableAdapter();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            ((System.ComponentModel.ISupportInitialize)(this.osszesAdatBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSourceSportIroda)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sportirodaDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sportirodaDataSetBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tipusBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).BeginInit();
            this.SuspendLayout();
            // 
            // osszesAdatBindingSource
            // 
            this.osszesAdatBindingSource.DataMember = "OsszesAdat";
            this.osszesAdatBindingSource.DataSource = this.bindingSourceSportIroda;
            // 
            // bindingSourceSportIroda
            // 
            this.bindingSourceSportIroda.DataSource = this.sportirodaDataSet;
            this.bindingSourceSportIroda.Position = 0;
            this.bindingSourceSportIroda.Sort = "";
            // 
            // sportirodaDataSet
            // 
            this.sportirodaDataSet.DataSetName = "sportirodaDataSet";
            this.sportirodaDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // sportirodaDataSetBindingSource
            // 
            this.sportirodaDataSetBindingSource.DataSource = this.sportirodaDataSet;
            this.sportirodaDataSetBindingSource.Position = 0;
            // 
            // osszesAdatTableAdapter
            // 
            this.osszesAdatTableAdapter.ClearBeforeFill = true;
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.BackgroundColor = System.Drawing.SystemColors.ActiveBorder;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.nevezesidDataGridViewTextBoxColumn,
            this.nevDataGridViewTextBoxColumn,
            this.szuldatumDataGridViewTextBoxColumn,
            this.nemDataGridViewTextBoxColumn,
            this.nev,
            this.datumDataGridViewTextBoxColumn,
            this.kezdesidoDataGridViewTextBoxColumn,
            this.nevezesidijDataGridViewTextBoxColumn,
            this.szintidoDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.osszesAdatBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(3, 3);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersVisible = false;
            this.tableLayoutPanel1.SetRowSpan(this.dataGridView1, 6);
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(868, 627);
            this.dataGridView1.TabIndex = 1;
            // 
            // nevezesidDataGridViewTextBoxColumn
            // 
            this.nevezesidDataGridViewTextBoxColumn.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader;
            this.nevezesidDataGridViewTextBoxColumn.DataPropertyName = "nevezes_id";
            this.nevezesidDataGridViewTextBoxColumn.HeaderText = "ID";
            this.nevezesidDataGridViewTextBoxColumn.Name = "nevezesidDataGridViewTextBoxColumn";
            this.nevezesidDataGridViewTextBoxColumn.ReadOnly = true;
            this.nevezesidDataGridViewTextBoxColumn.Width = 43;
            // 
            // nevDataGridViewTextBoxColumn
            // 
            this.nevDataGridViewTextBoxColumn.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells;
            this.nevDataGridViewTextBoxColumn.DataPropertyName = "vnev";
            this.nevDataGridViewTextBoxColumn.HeaderText = "Versenyző Neve";
            this.nevDataGridViewTextBoxColumn.Name = "nevDataGridViewTextBoxColumn";
            this.nevDataGridViewTextBoxColumn.ReadOnly = true;
            this.nevDataGridViewTextBoxColumn.Width = 101;
            // 
            // szuldatumDataGridViewTextBoxColumn
            // 
            this.szuldatumDataGridViewTextBoxColumn.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader;
            this.szuldatumDataGridViewTextBoxColumn.DataPropertyName = "szuldatum";
            this.szuldatumDataGridViewTextBoxColumn.HeaderText = "Kora";
            this.szuldatumDataGridViewTextBoxColumn.Name = "szuldatumDataGridViewTextBoxColumn";
            this.szuldatumDataGridViewTextBoxColumn.ReadOnly = true;
            this.szuldatumDataGridViewTextBoxColumn.Width = 54;
            // 
            // nemDataGridViewTextBoxColumn
            // 
            this.nemDataGridViewTextBoxColumn.DataPropertyName = "nem";
            this.nemDataGridViewTextBoxColumn.HeaderText = "Neme";
            this.nemDataGridViewTextBoxColumn.Name = "nemDataGridViewTextBoxColumn";
            this.nemDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // nev
            // 
            this.nev.DataPropertyName = "nev";
            this.nev.HeaderText = "Verseny Neve";
            this.nev.Name = "nev";
            this.nev.ReadOnly = true;
            // 
            // datumDataGridViewTextBoxColumn
            // 
            this.datumDataGridViewTextBoxColumn.DataPropertyName = "datum";
            this.datumDataGridViewTextBoxColumn.HeaderText = "Dátum";
            this.datumDataGridViewTextBoxColumn.Name = "datumDataGridViewTextBoxColumn";
            this.datumDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // kezdesidoDataGridViewTextBoxColumn
            // 
            this.kezdesidoDataGridViewTextBoxColumn.DataPropertyName = "kezdesido";
            this.kezdesidoDataGridViewTextBoxColumn.HeaderText = "Kezdési Idő";
            this.kezdesidoDataGridViewTextBoxColumn.Name = "kezdesidoDataGridViewTextBoxColumn";
            this.kezdesidoDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // nevezesidijDataGridViewTextBoxColumn
            // 
            this.nevezesidijDataGridViewTextBoxColumn.DataPropertyName = "nevezesi_dij";
            this.nevezesidijDataGridViewTextBoxColumn.HeaderText = "Nevezési Díj";
            this.nevezesidijDataGridViewTextBoxColumn.Name = "nevezesidijDataGridViewTextBoxColumn";
            this.nevezesidijDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // szintidoDataGridViewTextBoxColumn
            // 
            this.szintidoDataGridViewTextBoxColumn.DataPropertyName = "szintido";
            this.szintidoDataGridViewTextBoxColumn.HeaderText = "Szint Idő";
            this.szintidoDataGridViewTextBoxColumn.Name = "szintidoDataGridViewTextBoxColumn";
            this.szintidoDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(877, 3);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 19);
            this.button1.TabIndex = 0;
            this.button1.Text = "Szűrés Be";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.tableLayoutPanel1.ColumnCount = 3;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 100F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 100F));
            this.tableLayoutPanel1.Controls.Add(this.button1, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.label2, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.label3, 2, 3);
            this.tableLayoutPanel1.Controls.Add(this.dataGridView1, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.comboBox1, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.label1, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.button2, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.button3, 1, 5);
            this.tableLayoutPanel1.Controls.Add(this.numericUpDown1, 1, 4);
            this.tableLayoutPanel1.Controls.Add(this.numericUpDown2, 2, 4);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 6;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(1074, 633);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.label2.Location = new System.Drawing.Point(877, 87);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(94, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Díj \"Tól\"";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.label3.Location = new System.Drawing.Point(977, 87);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(94, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Díj \"Ig\"";
            // 
            // comboBox1
            // 
            this.comboBox1.DataSource = this.tipusBindingSource;
            this.comboBox1.DisplayMember = "nev";
            this.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(877, 53);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(94, 21);
            this.comboBox1.TabIndex = 2;
            this.comboBox1.ValueMember = "nev";
            // 
            // tipusBindingSource
            // 
            this.tipusBindingSource.DataMember = "tipus";
            this.tipusBindingSource.DataSource = this.bindingSourceSportIroda;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.label1.Location = new System.Drawing.Point(877, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(94, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Verseny Típusa";
            this.label1.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(977, 3);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 19);
            this.button2.TabIndex = 8;
            this.button2.Text = "Szűrés Ki";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(877, 133);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(75, 23);
            this.button3.TabIndex = 9;
            this.button3.Text = "Export";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Location = new System.Drawing.Point(877, 103);
            this.numericUpDown1.Maximum = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(94, 20);
            this.numericUpDown1.TabIndex = 10;
            this.numericUpDown1.ValueChanged += new System.EventHandler(this.numericUpDown1_ValueChanged);
            // 
            // numericUpDown2
            // 
            this.numericUpDown2.Location = new System.Drawing.Point(977, 103);
            this.numericUpDown2.Maximum = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.numericUpDown2.Name = "numericUpDown2";
            this.numericUpDown2.Size = new System.Drawing.Size(94, 20);
            this.numericUpDown2.TabIndex = 11;
            // 
            // tipusTableAdapter
            // 
            this.tipusTableAdapter.ClearBeforeFill = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1074, 633);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "Form1";
            this.Text = "Sportiroda";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.osszesAdatBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSourceSportIroda)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sportirodaDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sportirodaDataSetBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tipusBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.BindingSource bindingSourceSportIroda;
        private sportirodaDataSet sportirodaDataSet;
        private System.Windows.Forms.BindingSource sportirodaDataSetBindingSource;
        private System.Windows.Forms.BindingSource osszesAdatBindingSource;
        private sportirodaDataSetTableAdapters.OsszesAdatTableAdapter osszesAdatTableAdapter;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.BindingSource tipusBindingSource;
        private sportirodaDataSetTableAdapters.tipusTableAdapter tipusTableAdapter;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
        private System.Windows.Forms.NumericUpDown numericUpDown2;
        private System.Windows.Forms.DataGridViewTextBoxColumn nevezesidDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nevDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn szuldatumDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nemDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nev;
        private System.Windows.Forms.DataGridViewTextBoxColumn datumDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn kezdesidoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nevezesidijDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn szintidoDataGridViewTextBoxColumn;
    }
}

