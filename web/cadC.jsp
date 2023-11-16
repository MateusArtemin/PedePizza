<%-- 
    Document   : cadC.jsp
    Created on : 16 de nov. de 2023, 12:06:48
    Author     : artemin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Cliente"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Clientes</h1>
        <%
            
            Cliente clit = new Cliente(); 
            clit.setNome(request.getParameter("nome"));
            clit.setEmail(request.getParameter("email"));
            clit.setCPF(request.getParameter("CPF"));
            clit.setTelefone_cliente(request.getParameter("tel"));
            clit.setSenha(request.getParameter("senha"));
            
            
            
            
            //GRAVAR!
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", ""); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                ///          "Insert into clientes (nome, idade, renda) values('Aana', 28, 35345.75)"
                
                String sql = "INSERT INTO cliente (nome, senha, email, telefone_cliente, CPF) VALUES ('" +
              clit.getNome() + "', '" + 
              clit.getSenha() + "', '" + 
              clit.getEmail() + "', '" +
              clit.getTelefone_cliente() + "', '" + 
              clit.getCPF() + "')";
              
                stmt.executeUpdate(sql); // exec. Query.
                conexao.close(); //fecha                
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
            
            
           out.println(clit.getNome() + clit.getSenha() + clit.getEmail() + clit.getTelefone_cliente() + clit.getCPF());
            
           /* out.println("<b> Registro - Clientes </b>");
            out.println("<br> Identificação: " + cli.getId());
            out.println("<br> Nome: " + cli.getNome());
            out.println("<br> Idade: " + cli.getIdade());
            out.println("<br> Renda: " + cli.getRenda());*/

        %>
        
       
        
    </body>
</html>
