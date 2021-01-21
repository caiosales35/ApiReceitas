# API - Recipe

Api para site de receitas. Toda a comunicação entre cliente e API é feita atraves de JSON.

## Requisitos Necessários:

- Ruby 3.0 ou Superior
- Rails 6

## Funcionalidades

- Cadastro de usuários
- Login de Usuário
- Gerenciamento de receitas

## As receitas contem os seguintes dados:

- title : string (obrigatório)
- category : [entree | desert | apettizer | snack ] (obrigatório)
- preparation_time : float (obrigatório)
- oven_time : float (obrigatório)
- ingredients : text (obrigatório)
- steps : text (obrigatório)
- Image : string (opcional)
- user_id : integer foreign_key (opcional)

## Para cadastro de usuários são necessários os seguintes dados:

- email: string (obrigatório)
- password: string (obrigatório, minimo de 6 digitos)
- password_confirmation: string (obrigatório, minimo de 6 digitos)

## Rotas

### Interface de testes: GET "/"

Retorna uma pagina HTML com formularios para testar as rotas da API.

> Ex: http://<n/>127.0.0.1:3000/

### Listar receitas: GET "/api/v1/recipes"

Lista todas as receitas cadastradas; não é necessario enviar token de login de usuario no cabeçalho da requisicao.

> Ex: http://<n/>127.0.0.1:3000/api/v1/recipes

### Listar receitas de um usuário: GET "/api/v1/recipes/user/:id_do_usuario"

Lista receitas cadastradas por um usuario, utilizando o id do usuario; não é necessario enviar token de login de usuario no cabeçalho da requisição.

> Ex: http://<n/>127.0.0.1:3000/api/v1/recipes/user/5

### Auto login: GET "/api/v1/auto_login"

Rota para obter dados do usuário logado atualmente. Envia-se o token no cabeçalho da requisição, gerado para o usuário no momento do login (token valido por três horas).

> Ex: http://<n/>127.0.0.1:3000/api/v1/auto_login <br /><br />
> Ex de token de usuário no cabeçalho da requisição:
> Authorization: Bearer eXJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3fQ.\_sNft-gxvk8XA2nmRidMzRRh-BOBM-kuUM2odTcjR84

### Detalhes de uma receita: GET "/api/v1/recipes/id_da_receita"

Lista os detalhes de uma receita especifica, utilizando o id da receita; não é necessario enviar token de login de usuario no cabeçalho da requisição.

> Ex: http://<n/>127.0.0.1:3000/api/v1/recipes/14

### Deletar receita: DELETE "/api/v1/recipes/id_da_receita"

Deleta uma receita utilizando o id da receita; não é necessario enviar token de login de usuario no cabeçalho da requisição.

> Ex: http://<n/>127.0.0.1:3000/api/v1/recipes/11

### Criar receita: POST "/api/v1/recipes"

Cadastra uma receita, enviando os dados atraves de um JSON. No exemplo, não estamos enviando um token de login de usuario no cabeçalho da requisição; dessa forma, a receita sera atribuida a nenhum usuario. Além disso, todos os campos do exemplo, exceto o campo "Image" (string) , são obrigatorios.

> Ex: http://<n/>127.0.0.1:3000/api/v1/recipes <br /><br />
> Ex JSON: { <br />
> "title": "Leite doce", <br />
> "preparation_time": 3.0, <br />
> "oven_time": 1.0, <br />
> "ingredients": "Leite e caldo de cana", <br />
> "steps": "Pegue o leite e adicione caldo de cana", <br />
> "Image": null, <br />
> "category": "snack" <br />
> }

### Criar receita para um usuário: POST "/api/v1/recipes"

Cria uma receita para o usuario logado, enviando os dados da receita atraves de um JSON; todos os campos do exemplo, exceto o campo "Image" (string), são obrigatorios. Como estamos mandando um token de login de usuario no cabeçalho da requisição, a receita é vinculada ao usuario dono to token; caso o token não seja valido, a receita é atribuida a nenhum usuario.

> Ex: http://<n/>127.0.0.1:3000/api/v1/recipes <br /><br />
> Ex JSON: { <br />
> "title": "Leite doce", <br />
> "preparation_time": 3.0, <br />
> "oven_time": 1.0, <br />
> "ingredients": "Leite e caldo de cana", <br />
> "steps": "Pegue o leite e adicione caldo de cana", <br />
> "Image": null, <br />
> "category": "snack" <br />
> } <br /><br />
> Ex de token de usuário no cabeçalho da requisição:
> Authorization: Bearer eXJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3fQ.\_sNft-gxvk8XA2nmRidMzRRh-BOBM-kuUM2odTcjR84

### Criar usuário: POST "/api/v1/users"

Cadastra um novo usuario, enviando os dados, como no exemplo, via JSON. Obtemos como retorno, em caso de sucesso, o id do usuario, seu email e um token de login (valido por três horas).

> Ex: http://<n/>127.0.0.1:3000/api/v1/users <br /><br />
> Ex JSON: { <br />
> "email": "Caio110090xx@<n/>gmail.com", <br />
> "password": "caio123", <br />
> "password_confirmation": "caio123" <br />
> }

### Login de usuário: POST "/api/v1/login"

Faz login no sistema, enviando os dados, como no exemplo, via JSON. Obtemos como resposta, em caso de sucesso, o id do usuario, seu email e um token de login (valido por três horas).

> Ex: http://<n/>127.0.0.1:3000/api/v1/login <br /><br />
> Ex: { <br />
> "email": "Caio110090@<n/>gmail.com", <br />
> "password": "caio123" <br />
> }

### Editar receita: PUT "/api/v1/recipes/id_da_receita"

Edita uma receita de acordo com seu id, enviando os dados via JSON, só é necessario enviar os campos que se deseja atualizar. Não é necessário eviar token de login de usuário no cabeçalho da requisição, e não é permitido alterar o usuario a qual a receita pertence.

> Ex: http://<n/>127.0.0.1:3000/api/v1/recipes/17 <br /><br />
> Ex JSON: { <br />
> "title": "Leite com mel e limao show", <br />
> "preparation_time": 3.0, <br />
> "oven_time": 1.0, <br />
> "ingredients": "Leite, mel e limao", <br />
> "steps": "Pegue o leite e adicione mel com limao", <br />
> "Image": null, <br />
> "category": "snack" <br />
> }

## Licença

Esse projeto está sob a licença Apache 2.0. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

Feito por Caio Cesar de Morais Sales.
