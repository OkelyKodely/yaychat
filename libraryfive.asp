<body style="background-image:url(/graphics/grad.jpg)">
<%
dim from
dim too
from = request("to")
too = request("from")
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
dim sql
dim r
dim i
set s = cnn.execute("select imroomid as i from roomid where [to] = '"&from&"' order by imroomid desc")
if not s.eof then
  i = s("i")
end if
%>
<script>
  function insertText() {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function() {
      if(x.readyState == XMLHttpRequest.DONE) {
      }
    }
    x.open('post','/inc/findme2.asp?too2=<%=from%>&from2=<%=from%>&too=<%=from%>&from=<%=too%>&tt='+document.getElementById("tt").value+'&i=<%=i%>',true);
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
    x.open('post','/inc/me.asp?from=<%=too%>&too=<%=from%>&i=<%=i%>&',true);
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