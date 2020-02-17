<%
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"

dim master
master = session("userid")

if master <> "" then
	sqlStr = "delete from room where [master] = '"&master&"'"
     cnn.execute(sqlStr)
end if

session.abandon
cnn.close
response.redirect "/logon.asp"
%>