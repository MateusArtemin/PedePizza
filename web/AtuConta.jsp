<%-- 
    Document   : AtuConta
    Created on : 21 de nov. de 2023, 12:32:12
    Author     : artemin
--%>

<%@page import="controle.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        
        Cliente cli = new Cliente();
        cli.setCPF(request.getParameter("CPF"));
        cli.setEmail(request.getParameter("email"));
        cli.setSenha(request.getParameter("senha"));
        cli.setNome(request.getParameter("nome"));
        cli.setTelefone_cliente(request.getParameter("tel"));
        cli.setIdCli(Integer.parseInt(request.getParameter("idCLI")));
        
        Class.forName("com.mysql.jdbc.Driver"); // registra            
        Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", "");
        String SqlC = "UPDATE cliente SET nome = ?, senha = ?, email = ?, telefone_cliente = ?, CPF = ? WHERE idcliente = ?";
        
        try
        {
            
        try(PreparedStatement pss = conexao.prepareStatement(SqlC))
        {
            pss.setString(1, cli.getNome());
            pss.setString(2, cli.getSenha());
            pss.setString(3, cli.getEmail());
            pss.setString(4, cli.getTelefone_cliente());
            pss.setString(5, cli.getCPF());
            pss.setInt(6, cli.getIdCli());
            
            pss.executeUpdate();
        }
        conexao.close();
        
        %> <script>
        alert("Alterado!");
        window.location.href = "conta.jsp";
    </script>
    <%
        
        }catch(Exception ex) 
        {
        ex.printStackTrace();
        out.println("Erro: " + ex.toString());
        }
        %>
    </body>
</html>
