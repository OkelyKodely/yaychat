<%
dim categname
categname = request("categname")
if instr(application(categname&"_roomlist"), session("userid") & "") > 0 then
	application(categname&"_roomlist") = replace(application(categname&"_roomlist"), session("userid"), "coppersink21")
end if

Application.Lock
Application(categname&"_roomlist") = Application(categname&"_roomlist") & Session("userid") & ","
Application.Unlock

dim from
from = request("from")

Application.Lock
if Application(categname&"_roomlist") <> "," then
dim r2
redim r2(ubound(split(Application(categname&"_roomlist"),",")))
r2 = split(Application(categname&"_roomlist"),",")
for i = 1 to ubound(r2)
  if r2(i) <> "coppersink21" and r2(i) <> "" then
  %>
  <div onclick=window.open("/inc/library4.asp?from=<%=from%>&too=<%=r2(i)%>","","width=400,height=300,scrollbars=yes,toolbar=no,resizable=no")><%=r2(i)%></div>
  <%
  end if
next
end if
Application.Unlock
dim chatid, categid, text, userid, too
chatid = request("chatid")
categid = request("categid")
userid = session("userid")
too = re
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"

%>
