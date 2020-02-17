<%
dim chatid, categid
chatid = request("chatid")
categid = request("categid")
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
set rs0 = cnn.execute("select puid, cid, pid, ptext, categname from (select top 700 c.categname as categname, c.id as cid, p.text as ptext, p.userid as puid, p.id as pid from Chat p inner join categories c on c.id = p.categid where p.categid = " & categid & " and p.chatid = " & chatid & " order by p.id desc) sq order by pid asc")
%>
<div style="background-color:white;min-height:200px;border:2px solid yellow">
<div style="background-color:red;height:10px;border:1px solid black;color:#efefef;width:760px">
</div>
<div style="border:0px solid black;background-color:white">
<%
while not rs0.eof
categname = rs0("categname")
categid = rs0("cid")
%>
<div style="border:0px solid black;width:600px">
<div style="border:0px solid black;color:black;min-height:30px;width:600px">
<span style="color:blue;font-weight:bold"><%=rs0("puid")%>:</span> <%=replace(replace(replace(replace(replace(rs0("ptext"),":)","<img src=/graphics/smilie.gif>"),"8=","<img src=/graphics/penis.gif>"),":(","<img src=/graphics/sad.gif>"),"]:|","<img src=/graphics/pig.gif"),"|||","<img src=/graphics/grass.gif>")%>
</div>
</div>
<%
rs0.movenext
wend
%>
</div>
