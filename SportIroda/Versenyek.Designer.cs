
namespace SportIroda
{
    partial class Versenyek
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
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.nevDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.datumDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kezdesidoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nevezesidijDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.szintidoDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bindingSourceVersenyek = new System.Windows.Forms.BindingSource(this.components);
            this.sportirodaDataSet = new SportIroda.sportirodaDataSet();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.numericUpDown2 = new System.Windows.Forms.NumericUpDown();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.tipusBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.sportirodaDataSet1 = new SportIroda.sportirodaDataSet();
            this.button4 = new System.Windows.Forms.Button();
            this.versenyTableAdapter = new SportIroda.sportirodaDataSetTableAdapters.versenyTableAdapter();
            this.versenyekTableAdapter = new SportIroda.sportirodaDataSetTableAdapters.VersenyekTableAdapter();
            this.tipusTableAdapter = new SportIroda.sportirodaDataSetTableAdapters.tipusTableAdapter();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSourceVersenyek)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sportirodaDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tipusBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sportirodaDataSet1)).BeginInit();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 3;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 115F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 116F));
            this.tableLayoutPanel1.Controls.Add(this.dataGridView1, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.button1, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.button2, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.label1, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.label3, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.label4, 2, 3);
            this.tableLayoutPanel1.Controls.Add(this.numericUpDown1, 1, 4);
            this.tableLayoutPanel1.Controls.Add(this.numericUpDown2, 2, 4);
            this.tableLayoutPanel1.Controls.Add(this.comboBox1, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.button4, 1, 5);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 6;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.Size = new System.Drawing.Size(1218, 642);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.nevDataGridViewTextBoxColumn,
            this.datumDataGridViewTextBoxColumn,
            this.kezdesidoDataGridViewTextBoxColumn,
            this.nevezesidijDataGridViewTextBoxColumn,
            this.szintidoDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.bindingSourceVersenyek;
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.Location = new System.Drawing.Point(3, 3);
            this.dataGridView1.Name = "dataGridView1";
            this.tableLayoutPanel1.SetRowSpan(this.dataGridView1, 6);
            this.dataGridView1.Size = new System.Drawing.Size(981, 636);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // nevDataGridViewTextBoxColumn
            // 
            this.nevDataGridViewTextBoxColumn.DataPropertyName = "nev";
            this.nevDataGridViewTextBoxColumn.HeaderText = "Típus";
            this.nevDataGridViewTextBoxColumn.Name = "nevDataGridViewTextBoxColumn";
            // 
            // datumDataGridViewTextBoxColumn
            // 
            this.datumDataGridViewTextBoxColumn.DataPropertyName = "datum";
            this.datumDataGridViewTextBoxColumn.HeaderText = "Dátum";
            this.datumDataGridViewTextBoxColumn.Name = "datumDataGridViewTextBoxColumn";
            // 
            // kezdesidoDataGridViewTextBoxColumn
            // 
            this.kezdesidoDataGridViewTextBoxColumn.DataPropertyName = "kezdesido";
            this.kezdesidoDataGridViewTextBoxColumn.HeaderText = "Kezdési idő";
            this.kezdesidoDataGridViewTextBoxColumn.Name = "kezdesidoDataGridViewTextBoxColumn";
            // 
            // nevezesidijDataGridViewTextBoxColumn
            // 
            this.nevezesidijDataGridViewTextBoxColumn.DataPropertyName = "nevezesi_dij";
            this.nevezesidijDataGridViewTextBoxColumn.HeaderText = "Nevezési díj";
            this.nevezesidijDataGridViewTextBoxColumn.Name = "nevezesidijDataGridViewTextBoxColumn";
            // 
            // szintidoDataGridViewTextBoxColumn
            // 
            this.szintidoDataGridViewTextBoxColumn.DataPropertyName = "szintido";
            this.szintidoDataGridViewTextBoxColumn.HeaderText = "Szintidő";
            this.szintidoDataGridViewTextBoxColumn.Name = "szintidoDataGridViewTextBoxColumn";
            // 
            // bindingSourceVersenyek
            // 
            this.bindingSourceVersenyek.DataMember = "Versenyek";
            this.bindingSourceVersenyek.DataSource = this.sportirodaDataSet;
            // 
            // sportirodaDataSet
            // 
            this.sportirodaDataSet.DataSetName = "sportirodaDataSet";
            this.sportirodaDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(990, 3);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 19);
            this.button1.TabIndex = 1;
            this.button1.Text = "Szűrés Be";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(1105, 3);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 19);
            this.button2.TabIndex = 2;
            this.button2.Text = "Szűrés Ki";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(990, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(82, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Verseny Típusa";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(990, 75);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(52, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Díj \"Tól-\"";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(1105, 75);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(46, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Díj \"-Ig\"";
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Location = new System.Drawing.Point(990, 103);
            this.numericUpDown1.Maximum = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(109, 20);
            this.numericUpDown1.TabIndex = 8;
            // 
            // numericUpDown2
            // 
            this.numericUpDown2.Location = new System.Drawing.Point(1105, 103);
            this.numericUpDown2.Maximum = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.numericUpDown2.Name = "numericUpDown2";
            this.numericUpDown2.Size = new System.Drawing.Size(110, 20);
            this.numericUpDown2.TabIndex = 9;
            // 
            // comboBox1
            // 
            this.comboBox1.DataSource = this.tipusBindingSource;
            this.comboBox1.DisplayMember = "nev";
            this.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(990, 53);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(109, 21);
            this.comboBox1.TabIndex = 12;
            this.comboBox1.ValueMember = "nev";
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // tipusBindingSource
            // 
            this.tipusBindingSource.DataMember = "tipus";
            this.tipusBindingSource.DataSource = this.sportirodaDataSet1;
            // 
            // sportirodaDataSet1
            // 
            this.sportirodaDataSet1.DataSetName = "sportirodaDataSet";
            this.sportirodaDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // button4
            // 
            this.button4.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.button4.Location = new System.Drawing.Point(990, 128);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(109, 82);
            this.button4.TabIndex = 11;
            this.button4.Text = "Bezárás";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // versenyTableAdapter
            // 
            this.versenyTableAdapter.ClearBeforeFill = true;
            // 
            // versenyekTableAdapter
            // 
            this.versenyekTableAdapter.ClearBeforeFill = true;
            // 
            // tipusTableAdapter
            // 
            this.tipusTableAdapter.ClearBeforeFill = true;
            // 
            // Versenyek
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1218, 642);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "Versenyek";
            this.Text = "Versenyek";
            this.Load += new System.EventHandler(this.Versenyek_Load);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSourceVersenyek)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sportirodaDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tipusBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sportirodaDataSet1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.BindingSource bindingSourceVersenyek;
        private sportirodaDataSet sportirodaDataSet;
        private sportirodaDataSetTableAdapters.versenyTableAdapter versenyTableAdapter;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private sportirodaDataSetTableAdapters.VersenyekTableAdapter versenyekTableAdapter;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
        private System.Windows.Forms.NumericUpDown numericUpDown2;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.ComboBox comboBox1;
        private sportirodaDataSet sportirodaDataSet1;
        private System.Windows.Forms.BindingSource tipusBindingSource;
        private sportirodaDataSetTableAdapters.tipusTableAdapter tipusTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn nevDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn datumDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn kezdesidoDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nevezesidijDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn szintidoDataGridViewTextBoxColumn;
    }
}