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
        If Content <> "" then
            Dim array1 = Split(Content, ",")
            For j = 0 To array1.length - 1
                Dim array2 = Split(array1(j), "@")



                Dim xesub2 As XmlElement = xmlDoc.CreateElement("Detail")
                xesub2.SetAttribute("Item", array2(0))
                xesub2.SetAttribute("Quantity", array2(1))
                xesub1.AppendChild(xesub2) '新增到<Data>節點中

            Next

            root.AppendChild(xesub1) '新增到<Data>節點中 
            xmlDoc.Save(xmlFileName)   
            Response.Write("ok")

        Elseif  Content="" then
            'Response.Redirect("20210626home.aspx?status=error")
            Response.Write("error")
        End If


        ' Dim xesub2 As XmlElement = xmlDoc.CreateElement("Detail")
        ' xesub2.SetAttribute("Item", "綠茶")  
        ' xesub2.SetAttribute("Price", "1")
        ' xesub2.SetAttribute("Quantity", "1")
        ' xesub1.AppendChild(xesub2) '新增到<Data>節點中 


        
        'Response.Redirect("20210626home.aspx?status=addok&money=" & money)  '跳回前端  & = +
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


    '查詢總訂單人數
    '------------------------------------------------
    If Request("status") = "all" Then
        'Response.Write("123")
        Dim root As XmlElement = xmlDoc.DocumentElement
        Dim nodeList as XmlNodeList = root.SelectNodes("User")
        Response.Write(nodeList.count)
    End If

    '查日期 - 只顯示人名電話
    '------------------------------------------------
    If Request("status") = "date" Then
        Dim root As XmlElement = xmlDoc.DocumentElement
        Dim nodeList as XmlNodeList = root.SelectNodes("User[@Date='" & Request("date") & "']")
        for i = 0 to nodeList.count - 1

            Dim node As XmlElement = nodeList(i)
            Dim UserName as string = node.GetAttribute("UserName")
            Dim Phone as string = node.GetAttribute("Phone")

            Response.Write("UserName=" & UserName  & " ,Phone=" & Phone & "<br>")
        next
    End If


    '查日期 - 全部顯示
    '------------------------------------------------
    If Request("status") = "date_detail" Then
        Dim root As XmlElement = xmlDoc.DocumentElement
        Dim nodeList as XmlNodeList = root.SelectNodes("User[@Date='" & Request("date") & "']")
        for i = 0 to nodeList.count - 1

            Dim node As XmlElement = nodeList(i)
            Dim UserName as string = node.GetAttribute("UserName")
            Dim Phone as string = node.GetAttribute("Phone")

            Dim detailList as XmlNodeList = root.SelectNodes("User[@UserName='" & UserName & "' and @Phone='" & Phone & "']")


            Response.Write("UserName=" & UserName  & " ,Phone=" & Phone & "<br>")
            Response.Write("-----------------------------------------------<br>")

            for j = 0 to detailList.count - 1 '這人可能有重複訂單

                Dim detail As XmlElement = detailList(j) 
                Dim result as XmlNodeList = detail.GetElementsByTagName("Detail")


                for k as integer = 0 to result.count - 1 'Detail 清單

                    Dim thisDetail As XmlElement = result(k)
                    Dim Item1 as string = thisDetail.GetAttribute("Item")
                    Dim Quantity1 as string = thisDetail.GetAttribute("Quantity")

                    Response.Write("Item=" & Item1  & " ,Quantity=" & Quantity1 & "<br>")
                next

            next 
            Response.Write("-----------------------------------------------<br><br>")
        next
    End If

'Dim value1 = "123"
'"@key='"& value1 &"' and @key2='value2'"

'Dim a = "key='value1'"
'Dim b = Request("XXX")
'Dim c = "key2='value2'"
'Dim d = "key='value1'" & Request("XXX") & "key2='value2'"

'Dim e = "---'" & a & "'----"  &  "######" &  "@@@@@@"
'Dim e = "---'value'----"  &  "######" &  "@@@@@@"

'查人名 日期- 只顯示電話
    '------------------------------------------------
If Request("status") = "ShowPhone" Then
        Dim root As XmlElement = xmlDoc.DocumentElement
        Dim nodeList as XmlNodeList = root.SelectNodes("User[@UserName='" & Request("UserName") & "' and  @Date='" & Request("Date") & "']")

        for i = 0 to nodeList.count - 1 

            Dim node As XmlElement = nodeList(i)
            Dim UserName as string = node.GetAttribute("UserName")
            Dim Date1 as string = node.GetAttribute("Date")
            Dim Phone as string = node.GetAttribute("Phone")

             

            Response.Write("Phone=" & Phone  & " ,Date=" & date1 & "<br>")



        
        next
    End If
%>
