# Todo List - Live View
  
 Aplicativo de tarefas simples desenvolvido na linguagem Elixir, desafio do site [Mentor Frontend](https://www.frontendmentor.io/challenges/todo-app-Su1_KokOW)

- Adicionar novas tarefas à lista
- Marcar tarefas concluídas
- Excluir tarefas da lista
- Filtrar por todos/ativos/completos
- Limpar apenas as tarefas concluídas
- Alternar o modo claro e escuro
- Versão mobile e desktop
  
![screenshot](https://github.com/vinadeia/todo_list_live_view/blob/docs/docs/screenshot.jpg?raw=true)

## Pré-requisitos

  * PostgreSQL 10.22: [`Download`](https://www.postgresql.org/download/windows/)
  * Elixir 1.14.0: [`Download`](https://elixir-lang.org/install.html)

## Instalação:

  * Instale as dependencias com `mix deps.get`
  * No arquivo `/config/dev.exs` configure o username e password do seu banco
  * Crie e migre o banco de dados com o comando `mix ecto.setup`
  
## Como rodar:

* Inicie a aplicação com `mix phx.server`

Acesse a aplicação na porta 4000: [`localhost:4000`](http://localhost:4000) no seu browser

## Testes automáticos

* No arquivo `/config/text.exs` configure o username e password do seu banco
* Inicie o teste com `mix test`
