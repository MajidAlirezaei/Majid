using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;
using RWSmlmManager;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Security.Cryptography.Xml;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;

namespace RWCrypt
{
    public class RWCrypt
    {
        public string Encrypt(string TextToEncrypt)
        {
            return new RWCrypt.RijndaelSimple("").Encrypt(TextToEncrypt);
        }

        public string Decrypt(string EncryptedText)
        {
            return new RWCrypt.RijndaelSimple("").Decrypt(EncryptedText);
        }
        public static string Encrypt(string TextToEncrypt, string PassPhrase)
        {
            return new RWCrypt.RijndaelSimple(PassPhrase).Encrypt(TextToEncrypt);
        }

        public static string Decrypt(string EncryptedText, string PassPhrase)
        {
            return new RWCrypt.RijndaelSimple(PassPhrase).Decrypt(EncryptedText);
        }

        public static string getMD5Hash(string strToHash)
        {
            byte[] hash = new MD5CryptoServiceProvider().ComputeHash(Encoding.ASCII.GetBytes(strToHash));
            string str = "";
            byte[] numArray = hash;
            int index = 0;
            while (index < numArray.Length)
            {
                byte num = numArray[index];
                str += num.ToString("x2");
                checked { ++index; }
            }
            return str;
        }

        public static string GetXMLHash(string sXmlElement)
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(sXmlElement);
            return RWCrypt.GetXMLHash(xmlDocument.DocumentElement);
        }

        public static string GetXMLHash(XElement XMLElm)
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(XMLElm.ToString());
            return RWCrypt.GetXMLHash(xmlDocument.DocumentElement);
        }

        public static string GetXMLHash(XmlElement oXmlElement)
        {
            SignedXml signedXml = new SignedXml(oXmlElement)
            {
                SigningKey = (AsymmetricAlgorithm)new RSACryptoServiceProvider()
            };
            Reference reference = new Reference()
            {
                Uri = ""
            };
            XmlDsigEnvelopedSignatureTransform signatureTransform = new XmlDsigEnvelopedSignatureTransform();
            reference.AddTransform((Transform)signatureTransform);
            signedXml.AddReference(reference);
            signedXml.ComputeSignature();
            XmlElement xml = signedXml.Signature.GetXml();
            XmlNamespaceManager nsmgr = new XmlNamespaceManager(xml.OwnerDocument.NameTable);
            nsmgr.AddNamespace("sig", "http://www.w3.org/2000/09/xmldsig#");
            return ((XmlElement)xml.SelectSingleNode("//sig:DigestValue", nsmgr)).InnerText;
        }

        public static XElement SignXML(XElement oXElement)
        {
            if (oXElement == null)
                return (XElement)null;
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(oXElement.ToString());
            XmlElement documentElement = xmlDocument.DocumentElement;
            SignedXml signedXml = new SignedXml(documentElement)
            {
                SigningKey = KeyS.RwPrivateKey
            };
            Reference reference = new Reference()
            {
                Uri = ""
            };
            XmlDsigEnvelopedSignatureTransform signatureTransform = new XmlDsigEnvelopedSignatureTransform();
            reference.AddTransform((Transform)signatureTransform);
            signedXml.AddReference(reference);
            signedXml.ComputeSignature();
            XmlElement xml = signedXml.GetXml();
            documentElement.AppendChild(documentElement.OwnerDocument.ImportNode((XmlNode)xml, true));
            return XElement.Parse(documentElement.OuterXml);
        }

        public static XElement ReSignXML(XElement oXElement)
        {
            if (oXElement == null)
                return (XElement)null;
            IEnumerable<XElement> source = oXElement.Elements();
            Func<XElement, bool> predicate;
            //ISSUE: reference to a compiler-generated field
            //      if (RWCrypt._Closure\u0024__.\u0024I9\u002D0 != null)
            //{
            //    // ISSUE: reference to a compiler-generated field
            //    predicate = RWCrypt._Closure\u0024__.\u0024I9\u002D0;
            //}
            //else
            //{
            //    // ISSUE: reference to a compiler-generated field
            //    RWCrypt._Closure\u0024__.\u0024I9\u002D0 = predicate = (Func<XElement, bool>)(x => Operators.CompareString(x.Name.LocalName, "Signature", false) == 0);
            //}
            //source.Where<XElement>(predicate).Remove<XElement>();
            return RWCrypt.SignXML(oXElement);
        }

        public static bool VerifyXml(XElement oXElement)
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(oXElement.ToString());
            XmlElement documentElement = xmlDocument.DocumentElement;
            SignedXml signedXml = new SignedXml(documentElement);
            XmlNamespaceManager nsmgr = new XmlNamespaceManager(documentElement.OwnerDocument.NameTable);
            nsmgr.AddNamespace("sig", "http://www.w3.org/2000/09/xmldsig#");
            XmlElement xmlElement = (XmlElement)documentElement.SelectSingleNode("./sig:Signature", nsmgr);
            if (xmlElement == null)
                return false;
            signedXml.LoadXml(xmlElement);
            return signedXml.CheckSignature(KeyS.RWPublicKey);
        }

        public static RSACryptoServiceProvider GeneratePrivateKey()
        {
            RSACryptoServiceProvider cryptoServiceProvider = new RSACryptoServiceProvider(2048, new CspParameters()
            {
                Flags = CspProviderFlags.NoFlags
            });
            cryptoServiceProvider.ExportCspBlob(true);
            return cryptoServiceProvider;
        }

        public static string GeneratePrivateKeyAsXML()
        {
            return new RSACryptoServiceProvider(2048, new CspParameters()
            {
                Flags = CspProviderFlags.NoFlags
            }).ToXmlString(true);
        }

        public static byte[] GeneratePrivateKeyAsByte()
        {
            return new RSACryptoServiceProvider(2048, new CspParameters()
            {
                Flags = CspProviderFlags.NoFlags
            }).ExportCspBlob(true);
        }

        public static string GeneratePublicKeyFromPrivateKeyAsXML(string sXMLPrivateKey)
        {
            RSACryptoServiceProvider cryptoServiceProvider = new RSACryptoServiceProvider();
            cryptoServiceProvider.FromXmlString(sXMLPrivateKey);
            return RWCrypt.GeneratePublicKeyFromPrivateKeyAsXML((AsymmetricAlgorithm)cryptoServiceProvider);
        }

        public static string GeneratePublicKeyFromPrivateKeyAsXML(AsymmetricAlgorithm PrivateKey)
        {
            return PrivateKey.ToXmlString(false);
        }

        public static RSACryptoServiceProvider GenerateKeyFromXElement(
          XElement XElementKey)
        {
            RSACryptoServiceProvider cryptoServiceProvider = new RSACryptoServiceProvider();
            cryptoServiceProvider.FromXmlString(XElementKey.ToString());
            return cryptoServiceProvider;
        }

        public static RSACryptoServiceProvider GenerateKeyFromByteS(byte[] bKey)
        {
            RSACryptoServiceProvider cryptoServiceProvider = new RSACryptoServiceProvider();
            cryptoServiceProvider.ImportCspBlob(bKey);
            return cryptoServiceProvider;
        }

        private class RijndaelSimple
        {
            private const string saltValue = "s@1tValue";
            private const string hashAlgorithm = "SHA1";
            private const int passwordIterations = 2;
            private const string initVector = "@1B2c3D4e5F6g7H8";
            private const int keySize = 256;
            private byte[] initVectorBytes;
            private byte[] saltValueBytes;
            private PasswordDeriveBytes password;
            private byte[] keyBytes;
            private RijndaelManaged symmetricKey;
            private ICryptoTransform encryptor;

            public RijndaelSimple(string passPhrase)
            {
                this.initVectorBytes = Encoding.ASCII.GetBytes("@1B2c3D4e5F6g7H8");
                this.saltValueBytes = Encoding.ASCII.GetBytes("s@1tValue");
                this.password = new PasswordDeriveBytes(passPhrase, this.saltValueBytes, "SHA1", 2);
                this.keyBytes = this.password.GetBytes(32);
                this.symmetricKey = new RijndaelManaged();
                this.symmetricKey.Mode = CipherMode.CBC;
                this.encryptor = this.symmetricKey.CreateEncryptor(this.keyBytes, this.initVectorBytes);
            }

            public string Encrypt(string plainText)
            {
                byte[] bytes = Encoding.UTF8.GetBytes(plainText);
                MemoryStream memoryStream = new MemoryStream();
                CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, this.encryptor, CryptoStreamMode.Write);
                cryptoStream.Write(bytes, 0, bytes.Length);
                cryptoStream.FlushFinalBlock();
                byte[] array = memoryStream.ToArray();
                memoryStream.Close();
                cryptoStream.Close();
                return Convert.ToBase64String(array);
            }

            public string Decrypt(string cipherText)
            {
                int num1 = 0;
                string str1;
                int num2 = 0;
                try
                {

                    label_2:
                    ProjectData.ClearProjectError();
                    num1 = -2;
                    label_3:
                    int num3 = 2;
                    if (Operators.CompareString(cipherText.Trim(), string.Empty, false) != 0)
                        goto label_5;
                    label_4:
                    num3 = 3;
                    str1 = string.Empty;
                    goto label_21;
                    label_5:
                    label_6:
                    num3 = 5;
                    byte[] buffer = Convert.FromBase64String(cipherText);
                    label_7:
                    num3 = 6;
                    ICryptoTransform decryptor = this.symmetricKey.CreateDecryptor(this.keyBytes, this.initVectorBytes);
                    label_8:
                    num3 = 7;
                    MemoryStream memoryStream = new MemoryStream(buffer);
                    label_9:
                    num3 = 8;
                    CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, decryptor, CryptoStreamMode.Read);
                    label_10:
                    num3 = 9;
                    byte[] numArray = new byte[checked(buffer.Length + 1)];
                    label_11:
                    num3 = 10;
                    int count = cryptoStream.Read(numArray, 0, numArray.Length);
                    label_12:
                    num3 = 11;
                    memoryStream.Close();
                    label_13:
                    num3 = 12;
                    cryptoStream.Close();
                    label_14:
                    num3 = 13;
                    string str2 = Encoding.UTF8.GetString(numArray, 0, count);
                    label_15:
                    str1 = str2;
                    goto label_21;
                    label_17:
                    num2 = num3;
                    switch (num1 > -2 ? num1 : 1)
                    {
                        case 1:
                            int num4 = num2 + 1;
                            num2 = 0;
                            switch (num4)
                            {
                                case 1:
                                    goto label_2;
                                case 2:
                                    goto label_3;
                                case 3:
                                    goto label_4;
                                case 4:
                                    goto label_5;
                                case 5:
                                    goto label_6;
                                case 6:
                                    goto label_7;
                                case 7:
                                    goto label_8;
                                case 8:
                                    goto label_9;
                                case 9:
                                    goto label_10;
                                case 10:
                                    goto label_11;
                                case 11:
                                    goto label_12;
                                case 12:
                                    goto label_13;
                                case 13:
                                    goto label_14;
                                case 14:
                                    goto label_15;
                                case 15:
                                    goto label_21;
                            }
                            break;
                    }
                }
                catch (Exception ex) when (ex is Exception & num1 > 0 & num2 == 0)
                {
                    ProjectData.SetProjectError(ex);
                    //goto label_17;
                }
                throw ProjectData.CreateProjectError(-2146828237);
                label_21:
                if (num2 != 0)
                    ProjectData.ClearProjectError();
                return str1;


            }

        }

        public static string DecryptString(string sValue, string sKey = "$@I36FS<dj")
        {
            return NullToString((object)RWCrypt.Decrypt(sValue, sKey));
        }

        public static string EncryptString(string sValue, string sKey = "$@I36FS<dj")
        {
            return NullToString((object)RWCrypt.Encrypt(sValue, sKey));
        }
        public static string NullToString(object obj)
        {
            return obj != null ? Conversions.ToString(obj) : string.Empty;
        }
        public class KeyS
        {
            public const string RWKey = "$@I36FS<dj";
            private static AsymmetricAlgorithm _RWPublicKey;
            private static AsymmetricAlgorithm _RWPrivateKey;

            public static AsymmetricAlgorithm RWPublicKey
            {
                get
                {
                    if (KeyS._RWPublicKey == null)
                        KeyS._RWPublicKey = (AsymmetricAlgorithm)RWCrypt.GenerateKeyFromByteS(ReadByteSFromEmbeddedResource("RWPublicKey.001"));
                    return KeyS._RWPublicKey;
                }
            }

            public static AsymmetricAlgorithm RwPrivateKey
            {
                get
                {
                    if (KeyS._RWPrivateKey == null)
                        KeyS._RWPrivateKey = (AsymmetricAlgorithm)RWCrypt.GenerateKeyFromByteS(ReadByteSFromEmbeddedResource("RWPrivateKey.001"));
                    return KeyS._RWPrivateKey;
                }
            }
        }
        private static byte[] ReadByteSFromEmbeddedResource(string Name)
        {
            Stream manifestResourceStream = Assembly.GetExecutingAssembly().GetManifestResourceStream(Assembly.GetExecutingAssembly().GetName().Name + "." + Name);
            long length = manifestResourceStream.Length;
            byte[] buffer = new byte[checked((int)length + 1)];
            manifestResourceStream.Read(buffer, 0, checked((int)length));
            manifestResourceStream.Close();
            return buffer;
        }

        public string DecryptFile(string strpath)
        {

            string retval = "";

            try
            {
                clsConnection.localConnection localConnection = clsConnection.ReadSMLMConfig(strpath);
                retval = "Server: " + localConnection.ServerName;
                retval = retval + Environment.NewLine + "DataBase: " + localConnection.DBName;
                retval = retval + Environment.NewLine + "User: " + localConnection.UserName;
                retval = retval + Environment.NewLine + "Pass: " + localConnection.PWD;
                return retval;

            }
            catch (Exception ex)
            {
                ProjectData.SetProjectError(ex);
                MessageBox.Show(ex.Message);
                ProjectData.ClearProjectError();
                return "";
            }
        }
        public static string GetJalaliDate(
DateTime sDate,
bool bWithTime = true,
bool bWithSeconds = true,
bool bNormalFormat = false,
bool bReverse = false)
        {
            PersianCalendar persianCalendar = new PersianCalendar();
            string str1 = "";
            string str2 = "";
            string str3 = "";
            string str4 = "";
            if (bNormalFormat)
            {
                str3 = "/";
                str4 = ":";
            }
            int num;
            string str5;
            if (bReverse)
            {
                string str6 = str1;
                num = persianCalendar.GetDayOfMonth(sDate);
                string str7 = num.ToString().PadLeft(2, '0');
                string str8 = str3;
                string str9 = str6 + str7 + str8;
                num = persianCalendar.GetMonth(sDate);
                string str10 = num.ToString().PadLeft(2, '0');
                string str11 = str3;
                string str12 = str9 + str10 + str11;
                num = persianCalendar.GetYear(sDate);
                string str13 = num.ToString();
                str5 = str12 + str13;
            }
            else
            {
                string str6 = str1;
                num = persianCalendar.GetYear(sDate);
                string str7 = num.ToString();
                string str8 = str3;
                string str9 = str6 + str7 + str8;
                num = persianCalendar.GetMonth(sDate);
                string str10 = num.ToString().PadLeft(2, '0');
                string str11 = str3;
                string str12 = str9 + str10 + str11;
                num = persianCalendar.GetDayOfMonth(sDate);
                string str13 = num.ToString().PadLeft(2, '0');
                str5 = str12 + str13;
            }
            if (bWithTime)
            {
                string str6 = str2;
                num = persianCalendar.GetHour(sDate);
                string str7 = num.ToString().PadLeft(2, '0');
                string str8 = str4;
                string str9 = str6 + str7 + str8;
                num = persianCalendar.GetMinute(sDate);
                string str10 = num.ToString().PadLeft(2, '0');
                str2 = str9 + str10;
            }
            if (bWithSeconds)
            {
                string str6 = str2;
                num = persianCalendar.GetSecond(sDate);
                string str7 = num.ToString().PadLeft(2, '0');
                str2 = str6 + str7;
            }
            string str14;
            if (bReverse)
            {
                if (bNormalFormat)
                    str2 += " ";
                str14 = str2 + str5;
            }
            else
            {
                if (bNormalFormat)
                    str5 += " ";
                str14 = str5 + str2;
            }
            return str14;
        }
        public string DecryptLicFile(string tempFileName)
        {


            try
            {
                StreamReader streamReader = new StreamReader(tempFileName);
                string end = streamReader.ReadToEnd();
                try
                {

                    return ShowNewSite(end);
                    streamReader.Close();
                }
                catch (Exception ex)
                {
                    ProjectData.SetProjectError(ex);
                    ProjectData.ClearProjectError();
                    return "";
                }

            }
            catch (Exception ex)
            {
                ProjectData.SetProjectError(ex);

                ProjectData.ClearProjectError();
                return "";
            }


        }
        private string ShowNewSite(string licStr)
        {
            string retval = "";
            XElement oXElement;
            try
            {
                oXElement = XElement.Parse(licStr);
                if (!RWCrypt.VerifyXml(oXElement))
                {

                    return "";
                }
            }
            catch (XmlException ex)
            {
                ProjectData.SetProjectError((Exception)ex);

                ProjectData.ClearProjectError();
                return "";
            }
            if (Operators.CompareString(oXElement.Attribute((XName)"LicenseType").Value, "Server", false) == 0)
            {

                retval = retval + Environment.NewLine + "DataBase: " + oXElement.Attribute((XName)"ServerName").Value;
                retval = retval + Environment.NewLine + "SiteName: " + oXElement.Attribute((XName)"SiteName").Value;
                retval = retval + Environment.NewLine + "SiteTitle: " + oXElement.Attribute((XName)"SiteTitle").Value;
                retval = retval + Environment.NewLine + "DomainName: " + oXElement.Attribute((XName)"DomainName").Value;
                retval = retval + Environment.NewLine + "MaxCountOfWs: " + new int?(Conversions.ToInteger(oXElement.Attribute((XName)"MaxCountOfWS").Value));
                retval = retval + Environment.NewLine + "LicenseXML: " + oXElement;

                return retval;

             }
            return "";
        }
    }

}

