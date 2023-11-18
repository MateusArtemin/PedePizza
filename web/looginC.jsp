<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="controle.Login"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Hello World!</h1>
    <%
        Login log = new Login(); 
        log.setLogin(request.getParameter("cpf"));
        log.setSenha(request.getParameter("password"));
        
        out.println("login: " + log.getLogin() + "<br>");
        out.println("senha: " + log.getSenha() + "<br>");
        
        Connection conexao = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", "");
            
            String sql = "SELECT * FROM cliente WHERE cpf = ? AND senha = ?";
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, log.getLogin());
            stmt.setString(2, log.getSenha());
            
            rs = stmt.executeQuery();
            
            String nome = "";
            int uID = 0; // Alteração aqui
            
            if (rs.next()) {
                nome = rs.getString("nome");
                uID = Integer.parseInt(rs.getString("idcliente")); // Conversão para int
                out.println("Nome do cliente: " + nome + "<br>");
            }
            
            if (!nome.equals("")) { // Alteração aqui
    %>
            <script>
                localStorage.setItem("usuarioLogado", "true");
                localStorage.setItem("usuarioNome", "<%= nome %>");
                localStorage.setItem("usuarioId", <%= uID %>); // Sem aspas para valores inteiros
                window.location.href = "index.html";
            </script>
    <%
            } else {
                out.println("Nenhum resultado encontrado.");
    %>
            <script>
                localStorage.setItem("usuarioLogado", "false");
                alert("dados incorretos");
                window.location.href = "login.html";
            </script>
    <%
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            out.println("Erro: " + ex.toString());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conexao != null) conexao.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
