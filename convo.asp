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
        height:800px;
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
   </head>
   <body style="background-color:#88aa34">
     <table align="center">
     <tr>
<td >&nbsp;</td>
<td bgcolor="white" style="background-image:url(/graphics/grad.jpg);color:pink">
     <div class="logo" style="height:130px;width:300px">
       <a href="/">
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
        sqlStr = "select * from accounts where email = '"&userid&"' and passw3rd = '"&password&"'"
        set rs = cnn.execute(sqlStr)
        if userid <> "" then
          if not rs.eof then
            session("userid") = userid
          end if
        end if
      if session("userid") <> "" then
      %>
<font color="purple"><%=session("userid")&", welcome."%>
</font><a href="/signout.asp">Signout</a>
<%
      else
      %>
      <form method="post" action="">
      <table>
        <tr>
        <Td style="font-size:11px;color:gray">User ID:</td>
        <td> <input type="text" name="userid" style="width:120px;height:18px;border:1px solid white;background-color:gray;color:white;">
        </td>
      </tr>
      <tr>
        <td style="font-size:11px;color:gray">
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
      <script>
        function say() {
          document.getElementById("say").style.display = "none";
        }
        setTimeout(say,22);
      </script>
      <br><br>
<div style="width:100%;height:1px;border:1px solid black;color:black;">&nbsp;</div>
      <div id="say" style="text-align:center;width:1100px;font-size:13px">
<center>
<img src="/graphics/convo.png" width="900" height="250"><br><br>
Roots and allow told me a story. Have a hear. There once was a man in a shoe. His foot that is. It everywhere he stepped it twitched with pain and itchment. So he took off his socks shoe first then scratched like he never could before. So he gave a slap of his hand with or on his foot and said amen. The End. That is our history and heritage. We don't have any. Enjoy your time chatting that. Amen. 
</center>
</div>
  <div style="background-color:#aa7589">
<div style="width:500px;text-align:left">
<br>
  <a href="newcat.asp"><img src="/graphics/newcat.png"></a><Br>
<div style="background-color:#aa0011;height:41px;border:0px solid black;color:#efefef;width:1000px">
  <h3 style="color:yellow">Start Chatting in These Rooms....</h3>
</div>
<div style="border:0px solid black;width:900px">
<table>
<tr>
<td width="50">&nbsp;</td>
<td valign="top" width=800 align=left>
<%
dim cat
cat = "Dogs"

dim id
id = request("id")

dim title, text, user
user = session("userid")

sqlStr = "select c.id, c.categname, (select count(a.id) from Room a  where a.categid = c.id) as cnt from Categories c"
set rs = cnn.execute(sqlStr)
dim bgcolor
bgcolor = "gray"
dim ii
ii = 0
while not rs.eof
if ii mod 2 = 0 then
  bgcolor = "#4f4f4f"
else
  bgcolor = "gray"
end if
%>
<div style="background-color:<%=bgcolor%>;border:0px solid black;color:#ccc;height:30px">
  <A HREF='category.asp?cid=<%=rs("id")%>' style="color:pink;font-size:25px"><%=rs("categname")%></A> <font color="brown">(<%=rs("cnt")%> Rooms.)</font>
</div>
<%
ii = ii + 1
rs.movenext
wend
%>
</td>
<td width="50">&nbsp;</td>
<td valign="top">
<h1>Longest Chats</h1>
<!--#include file="inc/rightside.inc"-->
</td>
</tr>
</table>

</div>
</div>
</div>
</td>
</tr>
<tr>
<td />
</tr>
<tr>
<td />
</tr>
<tr>
<td />
</tr>
<tr>
<td height="10" />
</tr>
<tr>
<td />
<td>
     <div style="color:green;text-align:center;height:122px;width:1000px;background-color:gray">
       Copyright 2020 All Rights Reserved TheBulletinBoard.Com
     </div>
</td>
</tr>
</table>
   </body>
</html>