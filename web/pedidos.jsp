<%-- 
    Document   : pedidos
    Created on : 21 de nov. de 2023, 13:10:43
    Author     : artemin
--%>

<%@page import="controle.Produto"%>
<%@page import="controle.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            
            .container p {

                font-size: 16px;
                color: #333;

            }

            .container button {

                background-color: #007bff;
                color: #fff;
                padding: 10px;
                border: none;
                cursor: pointer;

            }


            .container {

                border: 1px solid #ccc;
                padding: 10px;
                margin-top: 20px;
                background-color: rgba(255, 255, 255, 0.8);

            }
        </style>
    </head>
    <body>
        
        <header>
        <h1>Pede Pizza</h1>
        <link href="css/style.css" rel="stylesheet"/>
    </header>
    
    <nav>
        
        <li><a href="index.html">HOME</a></li>
        <li><a href="pizzerias.html" class="switch3">PIZZARIAS</a></li>    
        <li><a href="EnderM.html" class="switch3">ENDEREÇOS</a></li>
        <li><a href="conta.jsp" class="switch3">CONTA</a></li>
        <li><a href="login.html" id="switch1">ENTRAR</a></li>
        <li><a href="register.html" id="switch2">CADASTRAR</a></li>

    </nav>

    <div class="background-image"></div>
        
        <%
                
         Class.forName("com.mysql.jdbc.Driver");      
         Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/Negocios", "root", "");
         String sql1 = "SELECT * FROM `usolog` ";
         String SQLPEDg = "SELECT * FROM `pedidog` WHERE IDCliente = ?";
         String SQLPRODp = "SELECT * FROM `produtospedido` WHERE IDPedido = ?";
         String SQLPRODName = "SELECT * FROM `produtos` WHERE idproduto = ?";
         
         float total = 0;
         
         Pedido ped = new Pedido();
         Produto prod = new Produto();
         
         try{
         
         try(PreparedStatement pstmt1 = conexao.prepareStatement(sql1))
         {
            ResultSet rs = pstmt1.executeQuery();
            if(rs.next())
            {                                   
            ped.setIdCli(Integer.parseInt(rs.getString("IdUsoLog")));  
            }
         }
         
         try(PreparedStatement pstmt2 = conexao.prepareStatement(SQLPEDg))
         {
            pstmt2.setInt(1, ped.getIdCli());
            ResultSet rsPedg = pstmt2.executeQuery();
 
            while(rsPedg.next())
            {                                   
                ped.setPedidoId(Integer.parseInt(rsPedg.getString("IDPedido")));
                %>
                
                <div class="container" style="margin-top: 20px;">
                <form name="FormDELPED" method="post" action="pedidosDEL.jsp">
                        
                    <h3> PEDIDO: <%=  ped.getPedidoId() %> </h3>
                    <input type="hidden" id="CIP" name="CIP" value="<%=  ped.getPedidoId() %>">
                    
                    <%
                        
                    try(PreparedStatement pst3 = conexao.prepareStatement(SQLPRODp))
                    {
                    pst3.setInt(1, ped.getPedidoId());
                    ResultSet rsProd = pst3.executeQuery();
                    
                    while (rsProd.next())
                    {
                        prod.setIdProd(Integer.parseInt(rsProd.getString("IDProduto")));
                        prod.setProdQuant(Integer.parseInt(rsProd.getString("Quantidade")));
                        prod.setProdPreco(Float.parseFloat(rsProd.getString("Preco")));
                        
                        try(PreparedStatement psNOme = conexao.prepareStatement(SQLPRODName))
                        {
                        psNOme.setInt(1, prod.getIdProd());
                        ResultSet rs = psNOme.executeQuery();
                        if(rs.next())
                        {                                   
                        prod.setProdNome(rs.getString("nome_produto"));
                        }
                        }
                        
                        %>
                        <p>
                        <%= prod.getProdNome() %>
                        Quantidade: <%= prod.getProdQuant() %> 
                        Preco: <%= prod.getProdPreco()%>
                        
                        </p>
                        
                        <%
                        total = total + prod.getProdPreco() * prod.getProdQuant();
                    }
                        
                        %>
                        
                        <p> Total: <%= total %> </p>
                        
                        <%
                    }

                    %>
                    
                    <button type="submit" value="excluir" > excluir </button> </p>
                </form>
                    </div>
                
                <%
                    total = 0;
            }
         }
         
         
         conexao.close();
        }
        catch(Exception ex)
                        {
                            ex.printStackTrace();
                            out.println("Erro: " + ex.toString());
                        }

        %>
        
         <script src="js/log.js"></script>
    </body>
</html>
