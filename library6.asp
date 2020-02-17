<%
dim from
dim too
from = request("userid")
too = request("too")
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
dim sql
dim r
sql = "select [from] from roomid where [to] = '"&from&"' and [from] is not null and done is null order by id desc"
'response.write sql
set rr = cnn.execute(sql)
if not rr.eof then
%>
<%=rr("from")%>
<%
cnn.execute("update roomid set done = 1 where done is null")
else
%>
failed
<%
end if
%>