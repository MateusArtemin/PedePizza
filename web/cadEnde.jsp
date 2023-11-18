<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Enderecos"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Clientes</h1>
        
        <% String minhaVariavel = "<script>document.write(localStorage.getItem('usuarioId'));</script>"; %>
        
        <%
            
            Enderecos clit = new Enderecos(); 
            String aaa = minhaVariavel;
            clit.setIdC(aaa);
            clit.setCep(request.getParameter("CEP"));
            clit.setRua(request.getParameter("Rua"));
            clit.setBairro(request.getParameter("Bairro"));
            clit.setCidade(request.getParameter("Cidade"));
            clit.setEstado(request.getParameter("Estado"));
            clit.setComplemento(request.getParameter("Complemento"));
            clit.setNumero(request.getParameter("Numero"));     
            
            out.println(
            "idC: " + clit.getIdC() + " <br>" +
            "CEP: " + clit.getCep() + "<br>" +
            "Rua: " + clit.getRua() + "<br>" +
            "Bairro: " + clit.getBairro() + "<br>" +
            "Cidade: " + clit.getCidade() + "<br>" +
            "Estado: " + clit.getEstado() + "<br>" +
            "Complemento: " + clit.getComplemento() + "<br>" +
            "Número: " + clit.getNumero() + "<br>");

            // GRAVAR!
            try {
                Class.forName("com.mysql.jdbc.Driver"); // registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", ""); // abre Conn
                
                String sql = "INSERT INTO endereco_cliente (id_end_cliente, rua, bairro, cidade, estado , complemento , numero , cep) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                
                //int aaaa = Integer.parseInt(clit.getIdC());
                
                //out.println("<br>"  + "Númerooo: " + aaaa + "<br>");
                
                try (PreparedStatement pstmt = conexao.prepareStatement(sql)) {
                    pstmt.setInt(1, 2);
                    pstmt.setString(2, clit.getRua());
                    pstmt.setString(3, clit.getBairro());
                    pstmt.setString(4, clit.getCidade());
                    pstmt.setString(5, clit.getEstado());
                    pstmt.setString(6, clit.getComplemento());
                    pstmt.setString(7, clit.getNumero());
                    pstmt.setString(8, clit.getCep());
                    
                    pstmt.executeUpdate(); // exec. Query.
                }
                
                conexao.close(); // fecha       
            }
            catch(Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
        %>
    </body>
</html>
