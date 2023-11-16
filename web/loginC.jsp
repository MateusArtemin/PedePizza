<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>

    
    
<%
    
    String cpf = request.getParameter("cpf");
    String password = request.getParameter("password");

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    
        // Estabelece a conexão com o banco de dados
        Class.forName("com.mysql.jdbc.Driver"); // Substitua pelo driver JDBC adequado
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", ""); // Substitua pelos detalhes do seu banco de dados

        // Consulta SQL para verificar o login
        
        try{
        String sql = "SELECT * FROM cliente WHERE cpf = '" + cpf + "' AND password = '" + password + "'";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        }catch (SQLException e) {
    e.printStackTrace();
         
        %>
            <script>
                localStorage.setItem("usuarioLogado", "true");
                window.location.href = "index.html"; // Redireciona para a página de boas-vindas
            </script>
<%
       
        if (rs.next()) {
                out.println("Login bem-sucedido!"); 
            } else {
                out.println("Login falhou. Verifique suas credenciais.");
            }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Fecha os recursos
        try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>

</body>
</html>
