#language:pt
#encoding UTF-8
#Autor:Gabriel Pereira

Funcionalidade:  Fazer Login Submarino
  Eu como usuário do submarino
  Quero logar na aplicação com sucesso

  @done @loginvalido
  Cenario:  Logar no site Submarino Sucesso
  Dado que faco login no submarino
  Entao devo visualizar a home do submarino

  @done @logininvalido
  Cenario:  Logar no site Submarino com login invalido
  Dado que faco login no submarino
  Entao devo visualizar a mensagem de alerta "E-mail ou senha incorretos"
