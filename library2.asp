<%
dim chatid, categid, text, userid
chatid = request("chatid")
categid = request("categid")
text = request("num")
userid = request("userid")
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
dim cc
set rs = cnn.execute("select max(id) as mass from chat")
if not rs.eof then
  cc = cint(rs("mass")) + 1
  cnn.execute("insert into chat (id, categid, text, userid, chatid) values ("&cc&","&categid&",'"&replace(text,vbCrLf,"<br/>")&"','"&userid&"',"&chatid&")")
end if
cnn.close
%>