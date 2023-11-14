<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.util.*" %>

<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
    <title>Seleção de Produtos</title>
</head>
<body>
    <h2>Selecione os Produtos</h2>

    <form action="" method="post">
        <%
            try {
                Context context = new InitialContext();
                DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/Negocios");
                Connection conn = ds.getConnection();

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Produtos");

                while (rs.next()) {
                    int idProduto = rs.getInt("idproduto");
                    String nomeProduto = rs.getString("nome_produto");
                    double precoProduto = rs.getDouble("preco");

                    out.println("<input type='checkbox' name='produtosSelecionados' value='" + idProduto + "'>" + nomeProduto + " - R$" + precoProduto + "<br>");
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException | NamingException e) {
                e.printStackTrace();
            }
        %>

        <br>
        <input type="submit" value="Enviar Pedido">
    </form>
</body>
</html>
