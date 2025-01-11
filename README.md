# To Do List App

## Introdução

Este é um aplicativo simples de Lista de Tarefas construído com Ruby on Rails. Ele permite que os usuários criem, atualizem e deletem tarefas dentro de listas.

## Funcionalidades

- Autenticação de usuários (Devise) 
- Criar, ler, atualizar e deletar listas
- Criar, atualizar e deletar tarefas
- Marcar tarefas como concluídas

## Versões

- Ruby: 4.3.1
- Rails: 8.0.1
- Devise: 4.9.4

## Instalação

1. Clone o repositório:
    ```sh
    git clone https://github.com/gabrielgatti7/Todo-list-Rails.git
    ```
2. Instale as dependências:
    ```sh
    bundle install
    ```
3. Configure o banco de dados:
    ```sh
    rails db:setup
    ```

## Uso

1. Inicie o servidor Rails:
    ```sh
    rails server
    ```
2. Abra seu navegador e vá para `http://localhost:3000`