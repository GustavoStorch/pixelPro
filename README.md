Este aplicativo está sendo desenvolvido para estudo de desenvolvimento com Flutter/Dart. Sendo um aplicativo para a não comercialização.
O front do aplicativo foi feito a partir de um mockup, escolhido na internet por sua beleza e disposição de elementos, sem se preocupar com sua temática. O desafio desta atividade é desenvolver um aplicativo à prototipação e dar continuidade de acordo com seu escopo. 

No mockup escolhido temos 3 telas do aplicativo referente ao login e registro: 

![MicrosoftTeams-image (3)](https://github.com/GustavoStorch/pixelPro/assets/112282756/6514aaf3-174c-453d-b62a-0e82c1847b27)

Para as telas das quais não estão contempladas no mockup, buscou-se utilizar os mesmos elementos e colorações, levando em conta a criação, tendo como vista que o nome do aplicativo que está no mockup faz crer que o aplicativo se trata
de um editor de fotos.

Este app possui as seguintes funcionalidades a serem desenvolvidas:

# Tela Introdutória:
- Login;
- Cadastrar-se;

# Tela de Login:
- Fazer login com e-mail e senha;
- Fazer login com a conta do Google
- Fazer login com a conta do Facebook;
- Cadastrar-se;
- Esqueci minha Senha.

# Tela de Registro:
- Fazer cadastro utilizando email e senha;
- Fazer cadastro utilizando o google;
- Fazer cadastro utilizando o Facebook.

# Tela Home:
- Listagem de fotos;
- Logo do aplicativo;
- Tirar foto;
- Escolher foto.

# Tela Home:
- Navbar com Botões de edição;
- Imagem ao centro para edição.

## 📳 Como executar/importar o projeto

- Certifique-se de que o Flutter esteja na versão 3.10.1 e o Dart na versão 3.0.1;
- Importe o projeto para sua IDE de preferência;
- Certifique-se de que a IDE esteja com os plugins Flutter e Dart instalados nas versões necessárias;
- Caso esteja no Android Studio, vá em File > Settings > Languages & Frameworks > Flutter e insira o caminho da pasta do SDK do Flutter em Flutter SDK path;
- Abra o arquivo pubspec.yaml e clique em pub get para que as dependências (pacotes) utilizadas no projeto sejam carregadas;
- Execute a aplicação.

  ## Atualização 25/10/2023
    Foram realizadas algumas melhorias no aplicativo, sendo todas em torno da adição do banco de dados firebase ao aplicativo, agora é possível realizar o login no app através do authentication, utilizando-se do email e senha cadastros.
  Além disso agora é possível adicionar imagens dentro do aplicativo, tendo em vista que é um aplicativo de imagens, além de adicionar imagens é possível listar todas as imagens que estão registradas no firebase, e caso queira é possível também remover as imagens.
  Por fim foi desenvolvido também uma função para atualizar uma determinada imagem porém está funcionalidade ainda não foi implementada na minha lista.
