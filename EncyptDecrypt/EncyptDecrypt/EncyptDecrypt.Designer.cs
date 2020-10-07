namespace WindowsFormsApp1
{
    partial class EncyptDecrypt
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
            this.txtEncrypt = new System.Windows.Forms.TextBox();
            this.btnEncrypt = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.btnDecrypt = new System.Windows.Forms.Button();
            this.txtDecrypt = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.txtwDec = new System.Windows.Forms.TextBox();
            this.btnwDec = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnwEnc = new System.Windows.Forms.Button();
            this.txtwEnc = new System.Windows.Forms.TextBox();
            this.txtLicDec = new System.Windows.Forms.TextBox();
            this.btnLicDec = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.btnLicEnc = new System.Windows.Forms.Button();
            this.txtLicEnc = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // txtEncrypt
            // 
            this.txtEncrypt.Location = new System.Drawing.Point(93, 12);
            this.txtEncrypt.Name = "txtEncrypt";
            this.txtEncrypt.Size = new System.Drawing.Size(497, 20);
            this.txtEncrypt.TabIndex = 0;
            // 
            // btnEncrypt
            // 
            this.btnEncrypt.Location = new System.Drawing.Point(93, 64);
            this.btnEncrypt.Name = "btnEncrypt";
            this.btnEncrypt.Size = new System.Drawing.Size(75, 23);
            this.btnEncrypt.TabIndex = 2;
            this.btnEncrypt.Text = "Encrypt";
            this.btnEncrypt.UseVisualStyleBackColor = true;
            this.btnEncrypt.Click += new System.EventHandler(this.btnEncrypt_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(32, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(46, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Encrypt:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(32, 41);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(47, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Decrypt:";
            // 
            // btnDecrypt
            // 
            this.btnDecrypt.Location = new System.Drawing.Point(93, 90);
            this.btnDecrypt.Name = "btnDecrypt";
            this.btnDecrypt.Size = new System.Drawing.Size(75, 23);
            this.btnDecrypt.TabIndex = 5;
            this.btnDecrypt.Text = "Decrypt";
            this.btnDecrypt.UseVisualStyleBackColor = true;
            this.btnDecrypt.Click += new System.EventHandler(this.btnDecrypt_Click);
            // 
            // txtDecrypt
            // 
            this.txtDecrypt.Location = new System.Drawing.Point(93, 38);
            this.txtDecrypt.Name = "txtDecrypt";
            this.txtDecrypt.Size = new System.Drawing.Size(497, 20);
            this.txtDecrypt.TabIndex = 6;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(241, 64);
            this.textBox1.Name = "textBox1";
            this.textBox1.ReadOnly = true;
            this.textBox1.Size = new System.Drawing.Size(349, 20);
            this.textBox1.TabIndex = 7;
            this.textBox1.Text = "User Id=RWDeveloper2;Password=";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(241, 90);
            this.textBox2.Name = "textBox2";
            this.textBox2.ReadOnly = true;
            this.textBox2.Size = new System.Drawing.Size(349, 20);
            this.textBox2.TabIndex = 8;
            this.textBox2.Text = "User Id=RWDeveloperReadOnly2;Password=";
            // 
            // txtwDec
            // 
            this.txtwDec.Location = new System.Drawing.Point(93, 155);
            this.txtwDec.Multiline = true;
            this.txtwDec.Name = "txtwDec";
            this.txtwDec.Size = new System.Drawing.Size(497, 75);
            this.txtwDec.TabIndex = 14;
            // 
            // btnwDec
            // 
            this.btnwDec.Location = new System.Drawing.Point(93, 270);
            this.btnwDec.Name = "btnwDec";
            this.btnwDec.Size = new System.Drawing.Size(75, 23);
            this.btnwDec.TabIndex = 13;
            this.btnwDec.Text = "Decrypt";
            this.btnwDec.UseVisualStyleBackColor = true;
            this.btnwDec.Click += new System.EventHandler(this.btnwDec_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(40, 155);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(47, 13);
            this.label3.TabIndex = 12;
            this.label3.Text = "Decrypt:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(3, 129);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(109, 13);
            this.label4.TabIndex = 11;
            this.label4.Text = "EncryptFilePathConn:";
            // 
            // btnwEnc
            // 
            this.btnwEnc.Location = new System.Drawing.Point(93, 241);
            this.btnwEnc.Name = "btnwEnc";
            this.btnwEnc.Size = new System.Drawing.Size(75, 23);
            this.btnwEnc.TabIndex = 10;
            this.btnwEnc.Text = "Encrypt";
            this.btnwEnc.UseVisualStyleBackColor = true;
            this.btnwEnc.Click += new System.EventHandler(this.btnwEnc_Click);
            // 
            // txtwEnc
            // 
            this.txtwEnc.Location = new System.Drawing.Point(118, 126);
            this.txtwEnc.Name = "txtwEnc";
            this.txtwEnc.Size = new System.Drawing.Size(472, 20);
            this.txtwEnc.TabIndex = 9;
            // 
            // txtLicDec
            // 
            this.txtLicDec.Location = new System.Drawing.Point(93, 334);
            this.txtLicDec.Multiline = true;
            this.txtLicDec.Name = "txtLicDec";
            this.txtLicDec.Size = new System.Drawing.Size(497, 75);
            this.txtLicDec.TabIndex = 20;
            // 
            // btnLicDec
            // 
            this.btnLicDec.Location = new System.Drawing.Point(93, 449);
            this.btnLicDec.Name = "btnLicDec";
            this.btnLicDec.Size = new System.Drawing.Size(75, 23);
            this.btnLicDec.TabIndex = 19;
            this.btnLicDec.Text = "Decrypt";
            this.btnLicDec.UseVisualStyleBackColor = true;
            this.btnLicDec.Click += new System.EventHandler(this.btnLicDec_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(40, 334);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(47, 13);
            this.label5.TabIndex = 18;
            this.label5.Text = "Decrypt:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(3, 308);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(98, 13);
            this.label6.TabIndex = 17;
            this.label6.Text = "EncryptFilePathLic:";
            // 
            // btnLicEnc
            // 
            this.btnLicEnc.Location = new System.Drawing.Point(93, 420);
            this.btnLicEnc.Name = "btnLicEnc";
            this.btnLicEnc.Size = new System.Drawing.Size(75, 23);
            this.btnLicEnc.TabIndex = 16;
            this.btnLicEnc.Text = "Encrypt";
            this.btnLicEnc.UseVisualStyleBackColor = true;
            // 
            // txtLicEnc
            // 
            this.txtLicEnc.Location = new System.Drawing.Point(118, 305);
            this.txtLicEnc.Name = "txtLicEnc";
            this.txtLicEnc.Size = new System.Drawing.Size(472, 20);
            this.txtLicEnc.TabIndex = 15;
            // 
            // EncyptDecrypt
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(602, 481);
            this.Controls.Add(this.txtLicDec);
            this.Controls.Add(this.btnLicDec);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.btnLicEnc);
            this.Controls.Add(this.txtLicEnc);
            this.Controls.Add(this.txtwDec);
            this.Controls.Add(this.btnwDec);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnwEnc);
            this.Controls.Add(this.txtwEnc);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.txtDecrypt);
            this.Controls.Add(this.btnDecrypt);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnEncrypt);
            this.Controls.Add(this.txtEncrypt);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "EncyptDecrypt";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtEncrypt;
        private System.Windows.Forms.Button btnEncrypt;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnDecrypt;
        private System.Windows.Forms.TextBox txtDecrypt;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox txtwDec;
        private System.Windows.Forms.Button btnwDec;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnwEnc;
        private System.Windows.Forms.TextBox txtwEnc;
        private System.Windows.Forms.TextBox txtLicDec;
        private System.Windows.Forms.Button btnLicDec;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnLicEnc;
        private System.Windows.Forms.TextBox txtLicEnc;
    }
}

