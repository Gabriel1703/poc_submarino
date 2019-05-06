class HomeSubmarinoPage < SitePrism::Page

#elementos do formulario deslogado
 element :span_minha_conta, :xpath, "//span[@class='usr-actions']//span[2]"
 element :button_entrar, "#h_usr-signin"
 element :button_entrar_facebook, :xpath, "//span[text()='Entrar com Facebook']"
 element :link_cliente_novo, :xpath, "//a[@class='usr-signup']"
 element :link_minha_conta, :xpath, "//a[@class='usr-account']"
 element :link_meus_pedidos, :xpath, "//a[@class='usr-orders']"
#elementos do formulario logado
 element :title_ola, :xpath, "//div[@class='usr-grt-text']"

 #realiza acesso a pagina de Login
  def acessar_login
  self.span_minha_conta.click
  self.button_entrar.click
  end

end
