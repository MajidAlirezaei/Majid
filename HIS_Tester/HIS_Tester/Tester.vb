Imports System.Reflection
Imports WrapperHisOperationalMode2KeyA2
Imports SDK.DataModel
Imports System.IO
Imports System.Text


Public Class Tester



    Private Sub btnEstelam_Click(sender As Object, e As EventArgs) Handles btnEstelam.Click
        Dim oPerson As Object

        If txtNationalCode.Text <> "" And txtBirthDate.Text <> "" Then

            Try
                Dim oSDk As Object

                Select Case cboSDKType.SelectedIndex
                    Case 0
                        oSDk = New Wrapper_HIS_SDK_General.HIS_SDK
                        oPerson = oSDk.Service.GetPersonByBirth(txtNationalCode.Text, CInt(txtBirthDate.Text))
                    Case 1
                        oSDk = New Wrapper_HIS_SDK_General.HISOperationalMode2KeyA2_SDk
                        oPerson = oSDk.Service.GetPersonByBirth(txtNationalCode.Text, CInt(txtBirthDate.Text))
                    Case 2
                        oSDk = New Wrapper_HIS_SDK_General.HISOperationalMode2KeyA3_SDK
                        oPerson = oSDk.Service.GetPersonByBirth(txtNationalCode.Text, CInt(txtBirthDate.Text))
                    Case 3
                        oSDk = New Wrapper_HIS_SDK_General.HISTestMode2KeyA2_SDK
                        oPerson = oSDk.Service.GetPersonByBirth(txtNationalCode.Text, CInt(txtBirthDate.Text))
                    Case 4
                        oSDk = New Wrapper_HIS_SDK_General.HISTestMode2KeyA3_SDK
                        oPerson = oSDk.Service.GetPersonByBirth(txtNationalCode.Text, CInt(txtBirthDate.Text))
                End Select
            Catch ex As Exception
                MessageBox.Show("خطا:" & vbNewLine & GetAllMessages(ex).ToString)
            End Try

            If oPerson Is Nothing Then Exit Sub

            Dim s As String
            s = "نام: " & oPerson.FirstName
            s = s & vbNewLine & "نام خانوادگی: " & oPerson.LastName
            s = s & vbNewLine & "نام پدر: " & oPerson.Father_FirstName
            s = s & vbNewLine & " تاریخ تولد: " & oPerson.BirthDate.Year & "/" & oPerson.BirthDate.Month & "/" & oPerson.BirthDate.Day
            s = s & vbNewLine & "کد ملی: " & oPerson.NationalCode
            s = s & vbNewLine & "جنسیت: " & oPerson.Gender.Value
            s = s & vbNewLine & "ملیت: " & oPerson.Nationality.Value


            txtInfo.Text = s
        End If
    End Sub

    Private Sub Tester_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Debugger.IsAttached Then
            txtBirthDate.Text = "1361"
            txtNationalCode.Text = "0064708934"
            txtNationalCode1.Text = "0064708934"
        End If
        cboSDKType.SelectedIndex = 0
    End Sub

    Private Sub btnVersionInfo_Click(sender As Object, e As EventArgs) Handles btnVersionInfo.Click
        Try
            Dim oSDk As Object
            Select Case cboSDKType.SelectedIndex
                Case 0
                    oSDk = New Wrapper_HIS_SDK_General.HIS_SDK
                    txtVersionInfo.Text = oSDk.Service.VersionInfo()
                Case 1
                    oSDk = New Wrapper_HIS_SDK_General.HISOperationalMode2KeyA2_SDk
                    txtVersionInfo.Text = oSDk.Service.VersionInfo()
                Case 2
                    oSDk = New Wrapper_HIS_SDK_General.HISOperationalMode2KeyA3_SDK
                    txtVersionInfo.Text = oSDk.Service.VersionInfo()
                Case 3
                    oSDk = New Wrapper_HIS_SDK_General.HISTestMode2KeyA2_SDK
                    txtVersionInfo.Text = oSDk.Service.VersionInfo()
                Case 4
                    oSDk = New Wrapper_HIS_SDK_General.HISTestMode2KeyA3_SDK
                    txtVersionInfo.Text = oSDk.Service.VersionInfo()
            End Select
        Catch ex As Exception
            MessageBox.Show("خطا:" & vbNewLine & GetAllMessages(ex).ToString)
        End Try
    End Sub

    Public Shared Function GetAllMessages(ByVal ex As Exception) As String
        If ex Is Nothing Then Throw New ArgumentNullException("ex")
        Dim sb As StringBuilder = New StringBuilder()

        While ex IsNot Nothing

            If Not String.IsNullOrEmpty(ex.Message) Then
                If sb.Length > 0 Then sb.Append(vbNewLine)
                sb.Append(ex.Message)
            End If

            ex = ex.InnerException
        End While

        Return sb.ToString()
    End Function



    Private Sub btnEstehghagh_Click(sender As Object, e As EventArgs) Handles btnEstehghagh.Click
        Dim oSDk As Object
        Dim oPerson As New DO_IDENTIFIER
        Dim oProvider As New DO_IDENTIFIER
        Dim oInsuranceInquiryVO() As InsuranceInquiryVO
        Dim str As String

        If txtNationalCode1.Text <> "" Then

            oPerson.Assigner = "National_Org_Civil_Reg"
            oPerson.ID = txtNationalCode1.Text
            oPerson.Issuer = "National_Org_Civil_Reg"
            oPerson.Type = "National_Code"

            oProvider.Assigner = "Med_Council"
            oProvider.ID = "1234"
            oProvider.Issuer = "Med_Council"
            oProvider.Type = "Med_ID"


            Try

                Select Case cboSDKType.SelectedIndex
                    Case 0

                        oSDk = New Wrapper_HIS_SDK_General.HIS_SDK
                        oInsuranceInquiryVO = oSDk.Service.CallupInsurance(oPerson, oProvider)
                    Case 1
                        oSDk = New Wrapper_HIS_SDK_General.HISOperationalMode2KeyA2_SDk
                        oInsuranceInquiryVO = oSDk.Service.CallupInsurance(oPerson, oProvider)
                    Case 2
                        oSDk = New Wrapper_HIS_SDK_General.HISOperationalMode2KeyA3_SDK
                        oInsuranceInquiryVO = oSDk.Service.CallupInsurance(oPerson, oProvider)
                    Case 3
                        oSDk = New Wrapper_HIS_SDK_General.HISTestMode2KeyA2_SDK
                        oInsuranceInquiryVO = oSDk.Service.CallupInsurance(oPerson, oProvider)
                    Case 4
                        oSDk = New Wrapper_HIS_SDK_General.HISTestMode2KeyA3_SDK
                        oInsuranceInquiryVO = oSDk.Service.CallupInsurance(oPerson, oProvider)
                End Select

                If oInsuranceInquiryVO.ToList.Count > 0 Then

                    For Each oIns In oInsuranceInquiryVO

                        str = str & vbNewLine & "نام: " & oIns.FirstName
                        str = str & vbNewLine & "نام خانوادگی: " & oIns.LastName
                        str = str & vbNewLine & "آدرس: " & oIns.Address
                        str = str & vbNewLine & "تاریخ تولد: " & oIns.BirthDate.ISOString
                        str = str & vbNewLine & "تاریخ انقضاء: " & oIns.ExpirationDate.ISOString
                        str = str & vbNewLine & "جنسیت: " & oIns.Gender.Value
                        str = str & vbNewLine & "نام بیمه: " & oIns.Insurer.Value
                        str = str & vbNewLine & "شماره بیمه: " & oIns.InsuranceNumber.ID
                        str = str & vbNewLine & "صندوق بیمه: " & oIns.InsurerBox.Value
                        str = str & vbNewLine & "کد پستی: " & oIns.PostalCode
                        str = str & vbNewLine

                        txtInsurer.Text = str

                        Dim strBase64 As String = oIns.PictureB64
                        If Not String.IsNullOrEmpty(strBase64) Then
                            Stop
                            Dim strSign As String = strBase64.Replace _
                               ("data:image/png;base64,", "")
                            Dim img As Image = ImageFromByteArray _
                               (Convert.FromBase64String(strSign))
                            PictureBox1.Image = SwicthColors(img)
                        End If

                    Next
                End If
            Catch ex As Exception
                MessageBox.Show("خطا:" & vbNewLine & GetAllMessages(ex).ToString)
            End Try

        End If
    End Sub

    Public Function ImageFromByteArray(btImage As Byte()) As Image
        Dim msStream As New MemoryStream(btImage)
        Dim imgImage As Image = Image.FromStream(msStream)
        Return imgImage
    End Function

    Public Function SwicthColors(imgSource As Image) As Bitmap
        Dim bmpSource As Bitmap = DirectCast(imgSource, Bitmap)
        Dim bmpClone As Bitmap = DirectCast(bmpSource.Clone(), Bitmap)
        Dim colPixel As Color
        For i As Integer = 0 To bmpClone.Width - 1
            For j As Integer = 0 To bmpClone.Height - 1
                colPixel = bmpClone.GetPixel(i, j)
                bmpClone.SetPixel(i, j, Color.FromArgb(255 -
                   colPixel.R, 255 - colPixel.G, 255 - colPixel.B))
            Next
        Next
        Dim bmpResult As Bitmap = DirectCast(bmpClone.Clone(), Bitmap)
        Return bmpResult
    End Function

    Private Sub btnPing_Click(sender As Object, e As EventArgs) Handles btnPing.Click


        lblResualtemsaj.Text = ""
        lblResualtfahm.Text = ""
        lblResualt7tir.Text = ""
        lblResualtakbr.Text = ""
        lblResualtalias.Text = ""
        lblResualtemhos.Text = ""
        lblResualtfate.Text = ""
        lblResualtfatero.Text = ""
        lblResualtfrzab.Text = ""
        lblResualtfrzgr.Text = ""
        lblResualthshnj.Text = ""
        lblResualthzrsl.Text = ""
        lblResualtlolgr.Text = ""
        lblResualtmothr.Text = ""
        lblResualtravan.Text = ""
        lblResualtshafa.Text = ""
        lblResualtshyft.Text = ""
        lblResualtEOP.Text = ""
        lblResualtDitas2.Text = ""
        lblResualtDitastest.Text = ""

        lblResualtemsaj.Text = Wrapper.Pingger.PingHost(lblemsaj.Tag.ToString)
        Me.Refresh()

        lblResualtfahm.Text = Wrapper.Pingger.PingHost(lblfahm.Tag.ToString)
        Me.Refresh()

        lblResualt7tir.Text = Wrapper.Pingger.PingHost(lbl7tir.Tag.ToString)
        Me.Refresh()

        lblResualtakbr.Text = Wrapper.Pingger.PingHost(lblakbr.Tag.ToString)
        Me.Refresh()

        lblResualtalias.Text = Wrapper.Pingger.PingHost(lblalis.Tag.ToString)
        Me.Refresh()

        lblResualtemhos.Text = Wrapper.Pingger.PingHost(lblemhos.Tag.ToString)
        Me.Refresh()

        lblResualtfate.Text = Wrapper.Pingger.PingHost(lblfate.Tag.ToString)
        Me.Refresh()

        lblResualtfatero.Text = Wrapper.Pingger.PingHost(lblfatero.Tag.ToString)
        Me.Refresh()

        lblResualtfrzab.Text = Wrapper.Pingger.PingHost(lblfrzab.Tag.ToString)
        Me.Refresh()

        lblResualtfrzgr.Text = Wrapper.Pingger.PingHost(lblfrzgr.Tag.ToString)
        Me.Refresh()

        lblResualthshnj.Text = Wrapper.Pingger.PingHost(lblhshnj.Tag.ToString)
        Me.Refresh()

        lblResualthzrsl.Text = Wrapper.Pingger.PingHost(lblhzrsl.Tag.ToString)
        Me.Refresh()

        lblResualtlolgr.Text = Wrapper.Pingger.PingHost(lbllolgr.Tag.ToString)
        Me.Refresh()

        lblResualtmothr.Text = Wrapper.Pingger.PingHost(lblmothr.Tag.ToString)
        Me.Refresh()

        lblResualtravan.Text = Wrapper.Pingger.PingHost(lblravan.Tag.ToString)
        Me.Refresh()

        lblResualtshafa.Text = Wrapper.Pingger.PingHost(lblshafa.Tag.ToString)
        Me.Refresh()

        lblResualtshyft.Text = Wrapper.Pingger.PingHost(lblshyft.Tag.ToString)
        Me.Refresh()

        lblResualtEOP.Text = Wrapper.Pingger.PingHost(lblEOP.Tag.ToString)
        Me.Refresh()

        lblResualtDitas2.Text = Wrapper.Pingger.PingHost(lblDitas2.Tag.ToString)
        Me.Refresh()

        lblResualtDitastest.Text = Wrapper.Pingger.PingHost(lblDitastest.Tag.ToString)
        Me.Refresh()

    End Sub
End Class
