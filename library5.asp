<%
dim from
dim too
from = session("userid")
too = request("too")
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
dim sql
dim r
set rs = cnn.execute("select max(imid) as cnt from chatim")
if not rs.eof then
  r = rs("cnt") + 1
else
  r = 1
end if
sql = "update chatim set [to] = '"&from&"' where [master] = '"&too&"'"
cnn.execute(sql)
%>
<form method="post" action="">
<table>
  <tr>
    <td valign="top">
      <%=from%>
    </td>
    <td valign="top">
      <input type="text" name="text">
    </td>
    <td valign="top">
      <input type="submit" value="submit">
    </td>
  </tr>
</table>
<div id="area" style="border:1px solid black;overflow:scroll;min-height:100px">
</div>
</form>
To: <%=too%>