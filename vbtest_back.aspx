<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Xml" %>

<%
    '讀取xml檔案
    '------------------------------------------------
    Dim xmlFileName = "D:/workspace/wendy_test/myproduct.xml"
    Dim i,j
    Dim xmlDoc As New XmlDocument()
    xmlDoc.Load(xmlFileName)
    Dim today = FormatDateTime(Now, DateFormat.ShortDate) '自己跳時間'
    Dim Content = Request("Content") '奶茶@2,綠茶@3'
    Dim money = Request("money")





    '新增功能
    '------------------------------------------------
    If Request("Add") = "1" Then
        Dim root As XmlNode = xmlDoc.SelectSingleNode("Data") '查詢<Data> 
        Dim xesub1 As XmlElement = xmlDoc.CreateElement("User")'建立一個<User>節點 
        xesub1.SetAttribute("UserName", Request("UserName")) '設定該節點UserName屬性 
        xesub1.SetAttribute("Phone", Request("Phone")) '設定該節點Phone屬性
        xesub1.SetAttribute("Date", today) '設定該節點Date屬性

        'Detail項目
        If Content <> "0" then
            Dim array1 = Split(Content, ",")
            For j = 0 To array1.length - 1
                Dim array2 = Split(array1(j), "@")



                Dim xesub2 As XmlElement = xmlDoc.CreateElement("Detail")
                xesub2.SetAttribute("Item", array2(0))
                xesub2.SetAttribute("Quantity", array2(1))
                xesub1.AppendChild(xesub2) '新增到<Data>節點中


            Next
        Elseif  Content="" then
            Response.Redirect("20210626home.aspx?status=error")
        End If


        ' Dim xesub2 As XmlElement = xmlDoc.CreateElement("Detail")
        ' xesub2.SetAttribute("Item", "綠茶")  
        ' xesub2.SetAttribute("Price", "1")
        ' xesub2.SetAttribute("Quantity", "1")
        ' xesub1.AppendChild(xesub2) '新增到<Data>節點中 


        root.AppendChild(xesub1) '新增到<Data>節點中 
        xmlDoc.Save(xmlFileName)   
        Response.Redirect("20210626home.aspx?status=addok&money=" & money)  '跳回前端  & = +
    End If


    '查詢功能
    '------------------------------------------------
    If Request("Query") = "1" Then
        Dim headerList As XmlNodeList = xmlDoc.SelectNodes("Data/*")
        For Each header As XmlNode In headerList
            if header.Attributes("UserName").Value = Request("UserName") and header.Attributes("Phone").Value = Request("Phone") then
                Dim PersonData = header.InnerXml
                Response.Write(PersonData)
            End if
            
        Next
    End If
%>
