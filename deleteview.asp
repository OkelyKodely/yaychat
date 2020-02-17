<%
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"

dim sqlStr1
dim chatid, categid
chatid = request("chatid")
categid = request("categid")
user = session("userid")

if chatid <> "" and user <> "" then
    sqlStr1 = "delete from room where [master] = '" & user & "' and chatid = " & chatid & " and categid = " & categid
    cnn.execute(sqlStr1)
end if

response.redirect "/category.asp?cid=" & categid
%>