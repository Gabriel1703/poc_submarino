#Autor:Gabriel Pereira
Dado("que faco login no submarino") do
  #referencias
  @login_submarino = LoginSubmarinoPage.new
  @home_subamrino = HomeSubmarinoPage.new
  @login_submarino.load
  @home_subamrino.acessar_login
  @login_submarino.fazer_login
  @home_subamrino.title_ola

end

Entao("devo visualizar a home do submarino") do
  expect(find(:xpath, "//div[@class='usr-grt-text']").text).to eql('Olá, ')
end
