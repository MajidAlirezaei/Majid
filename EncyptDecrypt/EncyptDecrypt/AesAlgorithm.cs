
using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;

namespace AesAlgorithm
{
    public class AesAlgorithm 
    {
        private const string initVector = ";2aW8*! d=Lgb`=+";
        private const int keysize = 256;
        private bool disposedValue;

        public string EncryptString(string plainText)
        {
            byte[] bytes1 = Encoding.UTF8.GetBytes(";2aW8*! d=Lgb`=+");
            byte[] bytes2 = Encoding.UTF8.GetBytes(plainText);
            string passPhrase = GetEncryptionKey();
            byte[] bytes3 = new PasswordDeriveBytes(passPhrase, (byte[])null).GetBytes(32);
            RijndaelManaged rijndaelManaged = new RijndaelManaged();
            rijndaelManaged.Mode = CipherMode.CBC;
            ICryptoTransform encryptor = rijndaelManaged.CreateEncryptor(bytes3, bytes1);
            MemoryStream memoryStream = new MemoryStream();
            CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, encryptor, CryptoStreamMode.Write);
            cryptoStream.Write(bytes2, 0, bytes2.Length);
            cryptoStream.FlushFinalBlock();
            byte[] array = memoryStream.ToArray();
            memoryStream.Close();
            cryptoStream.Close();
            return Convert.ToBase64String(array);
        }


        public string DecryptString(string cipherText)
        {
            byte[] bytes1 = Encoding.UTF8.GetBytes(";2aW8*! d=Lgb`=+");
            byte[] buffer = Convert.FromBase64String(cipherText);
            string passPhrase = GetEncryptionKey();
            byte[] bytes2 = new PasswordDeriveBytes(passPhrase, (byte[])null).GetBytes(32);
            RijndaelManaged rijndaelManaged = new RijndaelManaged();
            rijndaelManaged.Mode = CipherMode.CBC;
            ICryptoTransform decryptor = rijndaelManaged.CreateDecryptor(bytes2, bytes1);
            MemoryStream memoryStream = new MemoryStream(buffer);
            CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, decryptor, CryptoStreamMode.Read);
            byte[] numArray = new byte[checked(buffer.Length - 1 + 1)];
            int count = cryptoStream.Read(numArray, 0, numArray.Length);
            memoryStream.Close();
            cryptoStream.Close();
            return Encoding.UTF8.GetString(numArray, 0, count);
        }
        public string GetEncryptionKey()
        {
            return "a@0$$%as65AK(*^|arr^)(a^";
        }

    }
}
