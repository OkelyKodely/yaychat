<body style="background-image:url(/graphics/grad.jpg)">
<%
dim from
dim too
from = request("from")
too = request("too")
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
dim sql
dim r
r = 1
set rs = cnn.execute("select max(imroomid) as cnt from roomid")
if not rs.eof then
if not isnull(rs("cnt")) then
  r = rs("cnt") + 1
else
  r = 1
end if
else
  r = 1
end if
sql = "insert into roomid (imroomid,[from],inputdate,[to]) values ("&r&",'"&from&"',getdate(),'"&too&"')"
cnn.execute(sql)
%>
<script>
  function insertText() {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function() {
      if(x.readyState == XMLHttpRequest.DONE) {
      }
    }
    x.open('post','/inc/findme.asp?from=<%=from%>&tt='+document.getElementById("tt").value+'&i=<%=r%>&too=<%=too%>',true);
    x.send();
  }
  function slist() {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function() {
      if(x.readyState == XMLHttpRequest.DONE) {
        document.getElementById("area").innerHTML = x.responseText;
document.getElementById("area").scrollTop = document.getElementById("area").scrollHeight;
      }
    }
    x.open('post','/inc/me.asp?from=<%=from%>&too=<%=too%>&i=<%=r%>',true);
    x.send();
  }
  setInterval(slist, 1500);
</script>
<form method="post" action="">
<table>
  <tr>
    <td valign="top">
      <%=from%>
    </td>
    <td valign="top">
<table>
<tr>
<TD COLSPAN=3>
<script>
function cock() {
document.getElementById("tt").value += "8=";
}
function smile() {
document.getElementById("tt").value += ":)";
}
function sad() {
document.getElementById("tt").value += ":(";
}
function pig() {
document.getElementById("tt").value += "]:|";
}
function grass() {
document.getElementById("tt").value += "|||";
}
</script>
<img onclick="cock()" src="/graphics/penis.gif"><img onclick="smile()" src="/graphics/smilie.gif"><img onclick="sad()" src="/graphics/sad.gif"><img onclick="pig()" src="/graphics/pig.gif"><img onclick="grass()" src="/graphics/grass.gif">
</td>
</tr>
<tr>
<td>
</td>
</tr>
</table>
      <input id="tt" type="text" name="text" style="width:200px">
    </td>
    <td valign="top">
      <div onclick="insertText()">Submit</div>
    </td>
  </tr>
</table>
<div id="area" style="border:1px solid black;overflow:scroll;min-height:100px;max-height:120px">
</div>
</form>
To: <%=too%>
</body>