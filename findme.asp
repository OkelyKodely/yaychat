<%
dim i
dim from
dim too
dim too2
dim tt
dim abc
dim from2
from = request("from")
from2 = request("from2")
too = request("too")
too2 = request("from")
abc = request("abc")
i = request("i")
tt = request("tt")
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=dbHellonHru;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
dim sql
dim r
cnn.execute("insert into chatim (imid, [to], inputdate, [from], text) values ("&i&", '"&too&"', getdate(), '"&from&"', '<b style=""color:red"">"&from&"</b>: "&tt&"')")
%>