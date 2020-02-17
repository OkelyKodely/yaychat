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
for i = 1 to ubound(r2)
  if r2(i) <> "coppersink21" then
  %>
  <%=r2(i)%><br>
  <%
  end if
next
end if
Application.Unlock
%>
