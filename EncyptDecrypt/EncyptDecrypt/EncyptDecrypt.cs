using System;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class EncyptDecrypt : Form
    {
        public EncyptDecrypt()
        {
            InitializeComponent();
        }

        private void btnEncrypt_Click(object sender, EventArgs e)
        {
            AesAlgorithm.AesAlgorithm aes = new AesAlgorithm.AesAlgorithm();
            txtEncrypt.Text = aes.EncryptString(txtDecrypt.Text);
        }

        private void btnDecrypt_Click(object sender, EventArgs e)
        {
            AesAlgorithm.AesAlgorithm aes = new AesAlgorithm.AesAlgorithm();
            txtDecrypt.Text = aes.DecryptString(txtEncrypt.Text);
        }

        private void btnwEnc_Click(object sender, EventArgs e)
        {

            RWCrypt.RWCrypt rwenc = new RWCrypt.RWCrypt();
            txtwEnc.Text = rwenc.Encrypt(txtwDec.Text);
        }

        private void btnwDec_Click(object sender, EventArgs e)
        {
            RWCrypt.RWCrypt rwenc = new RWCrypt.RWCrypt();
            txtwDec.Text = rwenc.DecryptFile(txtwEnc.Text);
        }

        private void btnLicDec_Click(object sender, EventArgs e)
        {
            RWCrypt.RWCrypt rwenc = new RWCrypt.RWCrypt();
            txtLicDec.Text = rwenc.DecryptLicFile(txtLicEnc.Text);
        }
    }
}
