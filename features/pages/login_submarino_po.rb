#Autor:Gabriel Pereira

class LoginSubmarinoPage < SitePrism::Page

  #acessa a url do submarino
  set_url CONFIG['prod']

  #elementos do formulario
   element :title_login_cliente, :xpath, '//span[text()="Login do Cliente"]'
   element :input_email,  "#email-input"
   element :input_senha, "#password-input"
   element :button_continuar, "#login-button"
   element :button_facebookLogin, :xpath, "//button[@class='facebookLogin-btnHover']"
   element :link_cadastre, :xpath, "//p[@class='cadastrar-link']/a"
   element :msg_alerta_user_invalido, :xpath , "//span[text()='E-mail ou senha incorretos']"


   #realiza login no site submarino
   def fazer_login
     self.input_email.set $dados['user']['user_submarino']
     self.input_senha.set $dados['user']['password_submarino']
     self.button_continuar.click
   end

   def fazer_logininvalido
     self.input_email.set $dados["user"]["user_submarino_sem_cadastro"]
     self.input_senha.set $dados["user"]["password_submarino_sem_cadastro"]
     self.button_continuar.click
   end

end
