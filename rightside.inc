<%
dim categname
categname = request("categname")
if instr(application(categname&"_roomlist"), session("userid") & "") > 0 then
	application(categname&"_roomlist") = replace(application(categname&"_roomlist"), session("userid"), "coppersink21")
end if

Application.Lock
Application(categname&"_roomlist") = Application(categname&"_roomlist") & Session("userid") & ","
Application.Unlock

Application.Lock
if Application(categname&"_roomlist") <> "," then
dim r2
redim r2(ubound(split(Application(categname&"_roomlist"),",")))
r2 = split(Application(categname&"_roomlist"),",")
set rtrt = cnn.execute("select top 10 g.id, g.categname, r.roomid, c.chatid from chat c inner join room r on r.chatid = c.chatid inner join categories g on g.id = r.categid group by r.roomid, g.id, g.categname, c.chatid order by sum(c.chatid) desc")
while not rtrt.eof
  %>
  <b><a href='/view.asp?chatid=<%=rtrt("chatid")%>&categid=<%=rtrt("id")%>'>Room <%=rtrt("roomid")%> - <%=rtrt("categname")%></a></b><br>
  <%
rtrt.movenext
wend
end if
Application.Unlock
%>
