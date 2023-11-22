<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    
    <link href="css/style.css" rel="stylesheet"/>
    
    <title>SaP</title>

     <style type="text/css">
        .menu-container {
    max-width: 600px;
    margin: 20px auto;
    background-color: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
  }

  .menu-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ccc;
    padding: 10px 0;
  }

  .item-name {
    flex-grow: 1;
  }

  .quantity-price-container {
    display: flex;
    align-items: center;
  }

  .quantity-selector {
    display: flex;
    align-items: center;
    margin-right: 10px;
  }

  .quantity-btn {
    cursor: pointer;
    padding: 5px 10px;
    background-color: #4CAF50;
    color: #fff;
    border: none;
    border-radius: 4px;
    margin: 0 5px;
  }

  .price {
    margin-left: 10px;
  }

  .confirm-btn {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 20px;
  }

  .address-selector {
    margin-top: 20px;
    width: 100%;
    padding: 10px;
  }


    </style>
</head>
<body>
    <header>
        <h1>Pede Pizza</h1>
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
        String IdEndereco = "";
            List<String> Pedidos = new ArrayList<>(); 
            int idEstabelecimento = Integer.parseInt(request.getParameter("idEstabelecimento"));
            // Conectar ao banco de dados
            String url = "jdbc:mysql://localhost:3306/Negocios";
            String usuario = "root";
            String senha = "";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexao = DriverManager.getConnection(url, usuario, senha);

            // Consulta para obter o cardápio do estabelecimento específico
        String query = "SELECT * FROM Produtos WHERE id_prod_estab = ?";
        PreparedStatement pstmt = conexao.prepareStatement(query);
        pstmt.setInt(1, idEstabelecimento);
        ResultSet rs = pstmt.executeQuery();
        
        String query2 = "SELECT * FROM `usolog`";
        PreparedStatement pstmt2 = conexao.prepareStatement(query2);
        ResultSet rs2 = pstmt2.executeQuery();
        rs2.next();
        String query3 = "SELECT * FROM `endereco_cliente` WHERE id_end_cliente = " + rs2.getString("IdUsoLog");
        PreparedStatement psmt3 = conexao.prepareStatement(query3);
        ResultSet rs3 = psmt3.executeQuery();
        
    %>

    
    <form action="processaPedido.jsp" method="post">
        
       
    <div class="menu-container">

            <%
            int x = 0;
                while (rs.next()) {
                String GetValId = rs.getString("idproduto");
                x++;
            %>
            
            
<div class="menu-item">
        
        <div class="item-name"><%= rs.getString("nome_produto") %></div>
        <span class="price">R$: <%= rs.getDouble("preco") %></span>
        <div class="quantity-price-container">
          <div class="quantity-selector">
            <button type="button" class="quantity-btn" onclick="decrementQuantity('quantity<%= x %>')">-</button>
            <input type="number" name="quantity<%= x %>" value="0" style="width: 40px;">
            <input type="hidden" name="QId<%= x %>" value="<%= x %>">
            <button type="button" class="quantity-btn" onclick="incrementQuantity('quantity<%= x %>')">+</button>
          </div>
          
        </div>
      </div>
          
          <input type="hidden" name="ValIdProd<%= x %>" id="ValIdProd<%= GetValId %>" value="<%= GetValId %>" >
            <%
                }

                

            %>
        </table>
        <div class="menu-item">
        <label for="Rua">Rua:</label>
        <select id="localE" name="localE" style="width: 400px; height: 30px;">
        
        <% 
        while(rs3.next()){
        String rua = rs3.getString("rua");
        IdEndereco = rs3.getString("idendereco");
        
        %>
        
        <option value=<%=IdEndereco %>> <%=rua %> </option>
        
        <%
        
        }
        %>
</div>
        </select>
<br>
        <div class="menu-item">
        <input type="hidden" name="TotalD" id="TotalD" value=<%= x %> >
        <input type="hidden" name="EstablD" id="EstablD" value=<%= idEstabelecimento %> >
        
        <input type="submit" value="Enviar Pedido">
        </div>
    </form>

    <%
        // Fechar a conexão com o banco de dados
        rs.close();
        pstmt.close();
        conexao.close();
    %>

<script>
    var mensagemDoJSP = '<%= IdEndereco %>';
    
    function incrementQuantity(id) {
        var quantityElement = document.getElementsByName(id)[0];
        var currentQuantity = parseInt(quantityElement.value);
        quantityElement.value = currentQuantity + 1;
    }

    function decrementQuantity(id) {
        var quantityElement = document.getElementsByName(id)[0];
        var currentQuantity = parseInt(quantityElement.value);
        if (currentQuantity > 0) {
            quantityElement.value = currentQuantity - 1;
        }
    }
</script>

<script src="js/log.js"></script>

</body>
</html>