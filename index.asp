<html>
  <head>
	<link href="/inc/bootstrap.min.css" rel="stylesheet">    	<meta keywords="BBS, Forum, Web, Site">
    <meta description="The best BBS in the chaos">
    <script language="javascript">
    </script>
    <style>
	a {
		text-decoration:none;
		color:green;
	}
      h1 {color:red}
      .body {
        height:1300px;
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
<td style="background-image:url(/graphics/grad.jpg">
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
        cnn.open "PROVIDER=SQLOLEDB;DATABASE=TheBulletinBoardDotCom;DATA SOURCE=(local);User ID=sa;Password=coppersink21"

set rrs = cnn.execute("select categname from categories")
while not rrs.eof
dim categname2
categname2 = rrs("categname")
if instr(application(categname2&"_roomlist"), session("userid") & "") > -1 then
	application(categname2&"_roomlist") = replace(application(categname2&"_roomlist"), session("userid"), "coppersink21")
end if
rrs.movenext
wend

        dim userid, password
        userid = request("userid")
        password = request("password")
        dim sqlStr
        sqlStr = "select * from accounts where email = '"&userid&"' and passw3rd = '"&password&"'"
        set rs = cnn.execute(sqlStr)
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
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"

%>
	</div>
     <div class="body">
<table>
<tr>
<td valign=ToP>
<H3>
Welcome to Kathy's Rooms!  Here you will chat with <br>
your friends on the internet, be able to send private <br>
messages, and form valuable friendships.  So enjoy!
</h3>
<br><br><center>
<img width="600" src="/graphics/Happy Belated Birthday Berto!.png">
</center>
</td>
<td valign="top">
<h1>Longest Chats</h1>
<!--#include file="inc/rightside.inc"-->
</td>
</tr>
</table>

     </div>
</td>
</tr>
<tr>
<td />
<Td>
     <div style="color:green;text-align:center;height:122px;width:1000px;background-color:yellow">
       Copyright 2020 All Rights Reserved TheBulletinBoard.Com
     </div>
</td>
</tr>
</table>
   </body>
</html>