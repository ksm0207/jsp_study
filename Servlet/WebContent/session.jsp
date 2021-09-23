<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String flg = request.getParameter("check");
    if (flg != null) {
        session.invalidate();
        session = request.getSession();
    }

    long create = session.getCreationTime();
    long last = session.getLastAccessedTime();
    long time = (last - create) / 1000;
    if (time < 0)
        time = 0;

    String input = request.getParameter("input");
    if (input == null)
        input = "";

    ArrayList<String> msgs = (ArrayList<String>) session.getValue("messages");
    if (msgs == null)
        msgs = new ArrayList<String>();

    if (!input.equals(""))
        msgs.add(0, input);

    session.putValue("messages", msgs);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Sample jsp</title>
<style>
h1 {
    font-size: 16pt;
    background: #AAFFAA;
    padding: 5px;
}
</style>
</head>
<body>
    <h1>Sample jsp page</h1>
    <p>이 페이지는 샘플입니다.</p>
    <table>
        <form method="post" action="session.jsp">
            <tr>
                <td>입력</td>
                <td><input type="text" id="input" name="input"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="checkbox" id="check" name="check"> <label for="check">초기화</label></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="송신"></td>
            </tr>
        </form>
    </table>
    <hr>
    <p>(<%=time%> sec.)</p>
    <ol>
        <%
            for (int i = 0; i < msgs.size(); i++) {
        %>
        <li><%=msgs.get(i)%></li>
        <%
            }
        %>
    </ol>
</body>
</html>