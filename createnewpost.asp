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
<td>&nbsp;</td>
<td bgcolor="blue" style="background-image:url(/graphics/grad.jpg);color:pink">
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

set rrs = cnn.execute("select categname from categories")
while not rrs.eof
dim categname
categname = rrs("categname")
if instr(application(categname&"_roomlist"), session("userid") & "") > 0 then
	application(categname&"_roomlist") = replace(application(categname&"_roomlist"), session("userid"), "coppersink21")
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
%>
  </div>
  <div style="background-color:gray">
<h1 style="color:#cfcfcf">Posts</h1>
<BR>
<%
dim id
id = -7

dim title, text, user, cid
title = replace(request("title"),"'","''")
text = replace(request("text"), "'","''")
user = session("userid")
cid = request("categoryid")

if title = "1" then
  sqlStr = "select max(chatid) as ccii from room"
  set rrr = cnn.execute(sqlStr)
  dim master
  master = session("userid")
  if not rrr.eof then
       ccii = cint(rrr("ccii")) + 1
	  dim roomid
	  set rt = cnn.execute("select max(roomid) as rid from Room where categid = " & cid)
       roomid = 0
       if not rt.eof then
         roomid = cint(rt("rid")) + 1
       else
         roomid = 1
	  end if
  sqlStr = "insert into Room (roomid, [master], chatid, categid, title, text, postdatetime, postedby) values ("&roomid&",'"&master&"', "&ccii&", "&cid&", '"&title&"', 'it''s a chat app not a forum app', getdate(), '"&user&"')"
  cnn.execute(sqlStr)
  response.write "<BR><BR><font color='maroon'>made.</font><BR><BR>"
  end if
end if
%>
<h3 style="color:orange">
  Choose a Category<br>
</h3>
<%
s = "select id, categname from Categories"
set r = cnn.execute(s)
while not r.eof
%>
<a href='?categoryid=<%=r("id")%>' style="color:black"><%=r("categname")%></a><br>
<%
  r.movenext
wend
%>
<br><br>
<div style="width:600px">
<div style="height:40px;background-color:blue;border:1px solid black;color:#efefef">
  Create A Room
</div>
<div style="border:1px solid black">
<div style="border:1px solid black;color:#ccc">
<form action="" method="post">
<table>
  <tr>
    <td>&nbsp;</td>
  </tr>
<tr>
<td>&nbsp;</td>
<td>
<input type="hidden" name="title" value="1">
<input type="hidden" name="categoryid" value='<%=cid%>'>
<input type="submit" value="submit">
</td>
<td>&nbsp;</td>
<td>
</td>
<td>&nbsp;</td>
<td>
</td>
</tr>
</table>
</form>
</div>
</div>
     </div>
   </div>
 </div>
</td>
</tr>
<tr>
<td />
<td>
     <div style="color:green;text-align:center;height:122px;width:1000px;background-color:yellow">
       Copyright 2020 All Rights Reserved dwightschatroom.Com
     </div>
</td>
</tr>
</table>
   </body>
</html>