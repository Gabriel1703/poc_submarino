#Autor:Gabriel Pereira
Dado("que faco login no submarino") do
  #referencias
  @login_submarino = LoginSubmarinoPage.new
  @home_subamrino = HomeSubmarinoPage.new
  @login_submarino.load
  @home_subamrino.acessar_login
end

#login valido
Entao("devo visualizar a home do submarino") do
  @login_submarino.fazer_login
  @home_subamrino.title_ola
  expect(find(:xpath, "//div[@class='usr-grt-text']").text).to eql('Olá, ')
end
#login invalido
Entao("devo visualizar a mensagem de alerta {string}") do |msg_alerta|
  @login_submarino.fazer_logininvalido
  sleep(3)
  @login_submarino.wait_until_msg_alerta_user_invalido_visible
  expect(find(:xpath, "//span[text()='E-mail ou senha incorretos']").text).to eql(msg_alerta)
end
