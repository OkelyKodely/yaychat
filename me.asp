<%
dim i
dim from
dim too
from = request("from")
too = request("too")
i = request("i")
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
dim sql
dim r
set rs = cnn.execute("select [from], [to], imid, text from chatim where [from] = '"&from&"' and [to] = '"&too&"' and imid = " & i)
while not rs.eof
%>
<%=replace(replace(replace(replace(replace(rs("text"),":)","<img src=/graphics/smilie.gif>"),"8=","<img src=/graphics/penis.gif>"),":(","<img src=/graphics/sad.gif>"),"]:|","<img src=/graphics/pig.gif"),"|||","<img src=/graphics/grass.gif>")%><br>
<%
  rs.movenext
wend
%>