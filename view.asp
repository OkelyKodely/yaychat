<html>
  <head>
	<link href="/inc/bootstrap.min.css" rel="stylesheet">    	<meta keywords="BBS, Forum, Web, Site, Caring">
    <meta description="The best BBS in the chaos, why care?">
    <meta encoding="utf-8">
    <script language="javascript">
    </script>
    <style>
	a {
		text-decoration:none;
		color:green;
	}
      h1 {color:red}
      .body {
        height:5801px;
        width:1000px;
        background-color:gray;
     		padding:10px; 
color:#fefefe;
	}
      .logo {
        text-align:center;
        width:1000px;
        color:red;
      }
    </style>
<%
dim from
from = session("userid")
dim chatid, categid
categid = request("categid")
chatid = request("chatid")
%>
    <script language="javascript">
      function getChatText() {
        var xmlhttp = new XMLHttpRequest();
	   xmlhttp.onreadystatechange = function() {
           if(xmlhttp.readyState == XMLHttpRequest.DONE) {
		  document.getElementById("thearea").innerHTML = xmlhttp.responseText;
document.getElementById("thearea").scrollTop = document.getElementById("thearea").scrollHeight;
		}
	   }
        xmlhttp.open('post','/inc/library.asp?categid=<%=categid%>&chatid=<%=chatid%>', true);
        xmlhttp.send();
	 }
	 setInterval(getChatText, 1500);
    </script>
<script>
window.onload = function() {
document.getElementById("thearea").scrollTop = document.getElementById("thearea").scrollHeight;
}
</script>
   </head>
   <body style="background-color:#88aa34">
     <table align="center">
     <tr>
<td >&nbsp;</td>
<td bgcolor="navy" style="background-image:url(/graphics/grad.jpg)">
     <div class="logo" style=";height:130px;width:300px">
       <a href="/index.asp">
         <img src="/graphics/theBull.png" width="400" height="130">
       </a>
     </div>
     <div style="padding:12px;height:100px">
      <center>
      <a href="/convo.asp"><img src="/graphics/enter.png" width="110"></a>
      <a href="/index.asp"><img src="/graphics/aboutus.png" width="110"></a> 
      <a href="/ours.asp"><img src="/graphics/history.png" width="110"></a> 
      <a href="/sharingcaring.asp"><img src="/graphics/caring.png" width="110"></a> 
      <a href="/whycare.asp"><img src="/graphics/whycare.png" width="110"></a>
      <a href="/register.asp"><img src="/graphics/register.png" width="110"></a>
      <a href="/logon.asp"><img src="/graphics/logon.png" width="110"></a> 
      <a href="/signout.asp"><img src="/graphics/signout.png" width="110"></a><BR><BR>
      </center>
      <%
        Set cnn = Server.CreateObject("ADODB.Connection")
        cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"

        dim userid, password
        userid = request("userid")
        password = request("password")
        dim sqlStr
        if userid <> "" then
          sqlStr = "select * from accounts where email = '"&userid&"' and passw3rd = '"&password&"'"
          set rs = cnn.execute(sqlStr)
          if not rs.eof then
            session("userid") = userid
          end if
        end if
      if session("userid") <> "" then
      %>
<%=session("userid")&", welcome."%>
<%
      else
      %>
      <form method="post" action="">
      <table>
        <tr>
        <Td style="font-size:11px">User ID:</td>
        <td> <input type="text" name="userid" style="width:120px;height:18px;border:1px solid white;background-color:gray;color:white;">
        </td>
      </tr>
      <tr>
        <td style="font-size:11px">
        Password:</td>
        <td><input type="text" name="password" style="width:120px;height:18px;border:1px solid white;background-color:gray;color:white;">
        </td>
      </tr>
      <tr>
        <td align=center colspan=2><input style="font-size:12px" type="submit" value="submit">
        </td>
      </tr>
    </table>
      </form>
      <%
      end if
%>
	</div>
<br><br>
  <center>
    <div style="background-color:navy">
    <table>
      <tr>
        <td align="center">
    <div style="text-align:left;background-color:blue">
<h1 style="color: Maroon; font-weight: bold"><a href="convo.asp">> Chatrooms</a></h1>
<a href='/category.asp?cid=<%=request("categid")%>'>Other Rooms</a>
<%
set r = cnn.execute("select categname from Categories where id = " & categid)
if not r.eof then
categname = r("categname")
set rp = cnn.execute("select roomid from Room where chatid = " & chatid)
%>
<h2 style="color:#fcfcfc;background-color:black"><%=categname%>
<%
%>
</h2>
<%
if not rp.eof then
%>
<h2>ROOM <%=rp("roomid")%></h2>
<%
end if
end if
%>

<%
dim sqlStr1

title = replace(request("title"),"'","''")
text = replace(request("text"), "'","''")
user = session("userid")

if title <> "" and user <> "" then
  sqlStr1 = "insert into Room (categid, text, postdatetime, postedby) values ("&categid&", '"&text&"', getdate(), '"&user&"')"

  cnn.execute(sqlStr1)
end if

dim cat
cat = "Dogs"

dim id
id = request("id")

dim title, text, user
user = session("userid")

dim categname

categid = request("categid")

set r = cnn.execute("select categname from Categories where id = " & categid)
if not r.eof then
  categname = r("categname")
end if
%>
<table>
<tr>
<td VALIgn=top>
<div id="thearea" style="overflow:scroll;background-color:white;max-height:370px;word-wrap:break-word">
</div>
</td>
<td bgcolor=white vAlign=Top>
<div style="background-color:black;height:130px">
<h1>Room List</h1>
</div>
<script>
function rlist() {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if(xmlhttp.readyState == XMLHttpRequest.DONE) {
      document.getElementById("rlist").innerHTML = xmlhttp.responseText;
    }
  }
  xmlhttp.open('post','/inc/library3.asp?from=<%=from%>&categname=<%=categname%>',true);
  xmlhttp.send();
}
setInterval(rlist, 1500);
function rrlist() {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if(xmlhttp.readyState == XMLHttpRequest.DONE) {
//document.getElementById("rlist").innerHTML = xmlhttp.responseText;
if(xmlhttp.responseText != "" && xmlhttp.responseText.indexOf("failed") == -1) {
	window.open("/inc/libraryfive.asp?to=<%=session("userid")%>&from="+xmlhttp.responseText,"","width=400,height=	300,scrollbars=yes,toolbar=no,resizable=no");
}
    }
  }
  xmlhttp.open('post','/inc/library6.asp?userid=<%=session("userid")%>',true);
  xmlhttp.send();
}
setInterval(rrlist,1500);
</script>
<div id="rlist" style="overflow:scroll">
</div>
</td>
</tr>
</table>
<%

%>
<%
%>
<br><br>
<br><br>
<div style="background-color:blue;border:1px solid black;color:#efefef;width:800px">
  Type A Text:
</div>
<div style="border:1px solid black;width:800px">
<div style="border:1px solid black;color:#ccc;width:800px">
<form action="" method="post">
<table>
<tr>
<TD COLSPAN=3>
<script>
function cock() {
document.getElementById("num").value += "8=";
}
function smile() {
document.getElementById("num").value += ":)";
}
function sad() {
document.getElementById("num").value += ":(";
}
function pig() {
document.getElementById("num").value += "]:|";
}
function grass() {
document.getElementById("num").value += "|||";
}
</script>
<img onclick="cock()" src="/graphics/penis.gif"><img onclick="smile()" src="/graphics/smilie.gif"><img onclick="sad()" src="/graphics/sad.gif"><img onclick="pig()" src="/graphics/pig.gif"><img onclick="grass()" src="/graphics/grass.gif">
</td>
</tr>
<tr>
<td>

</td>
<td>
<script>
function insertText() {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if(xmlhttp.readyState == XMLHttpRequest.DONE) {
      document.getElementById("num").value = "";
    }
  }
  xmlhttp.open('post','/inc/library2.asp?userid=<%=session("userid")%>&chatid=<%=chatid%>&categid=<%=categid%>&num='+document.getElementById("num").value,true);
  xmlhttp.send();
}

</script>
<textarea name="text" id="num" style="width:790px;height:130px"></textarea>
<input type="hidden" name="id" value='<%=request("id")%>'>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</td>
<td>&nbsp;</td>
<td><input type="button" onclick="insertText()" value="Enter">
<td>&nbsp;</td>
</td>
</tr>
</table>
</form>
<%
%>
</div>
</td>
</tr>
</table>
</div>

<applet code = "/waar/NewJApplet.class" width = "1000" height = "800">
</applet>

  </center>
</td>
</tr>
<tr>
<td />
<td>
     <div style="color:green;text-align:center;height:122px;width:1000px;background-color:yellow">
       Copyright 2020 All Rights Reserved HellonHru.Com
     </div>
</td>
</tr>
</table>
   </body>
</html>