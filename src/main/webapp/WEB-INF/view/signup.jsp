<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name='frm' action='saveuser' method="post">
<input type="text" name='name' value='' style='width:400px; height:40px'/>
<br></br>
<input type="text" name='email' value='' style='width:400px; height:40px'/>
<br></br>
<input type="text" name='contact' value='' style='width:400px; height:40px'/>
<br></br>
<input type="text" name='username' value='' style='width:400px; height:40px'/>
<br></br>
<input type="text" name='password' value='' style='width:400px; height:40px'/>
<br></br>
<select style='width:400px; height:40px' name='cid'>
  <option>Select Cource</option>

   <c:forEach var="cource" items="${courceList}"> 
    <option value='${cource.getId()} '>	${cource.getCourceName()}</option>
   </c:forEach>

  
</select>
<br></br>
<input type="submit" name='s' value='Register' style='width:400px; height:40px'/>
<br></br>
</form>
</body>
</html>