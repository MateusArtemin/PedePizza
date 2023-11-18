

         
        function atualizar() {
            
            var s1 = document.getElementById("switch1");
            var s2 = document.getElementById("switch2");
            var s3 = document.getElementById("switch3");
                   
            
            
            
            if (localStorage.getItem('usuarioLogado') === "true") {
                s1.innerHTML = 'PEDIDOS';
                s1.href = 'pedidos.html';
                s2.innerHTML = 'SAIR';
                s2.href = 'javascript:deslogarUsuario()';      
                
 
            } else {
                s1.innerHTML = 'ENTRAR';
                s1.href = 'login.html';
                s2.innerHTML = 'CADASTRAR';
                s2.href = 'register.html';
            }
            
            
            
            if(localStorage.getItem('usuarioLogado')  === "false")
            {
                
                s3.addEventListener("click", function(event) {
                    event.preventDefault();
                    alert("você precisa ENTRAR com sua conta para adicionar endereços");
                    });
            }else
            {
                
            }
        }
        
        function deslogarUsuario() {
            localStorage.setItem('usuarioLogado', 'false');
            localStorage.setItem('usuarioId', '0');
            localStorage.setItem('usuarioNome', '');
            
       atualizar();

     window.location.href = 'index.html';
    
}

    
        window.onload = atualizar();
