defmodule LiveViewTodoWeb.PageLiveTest do
  use LiveViewTodoWeb.ConnCase
  alias LiveViewTodo.Todo
  import Phoenix.LiveViewTest

  # test "GET /", %{conn: conn} do
  #   conn = get(conn, "/")
  #   assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  # end

  describe "handle_event" do

    test "Cria uma nova tarefa", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      expected_response = "Criar testes unitários"

      assert render_submit(view, :create, %{"text" => "Criar testes unitários"}) =~ expected_response
    end

    test "Update da tarefa", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      {:ok, todo} = Todo.create_todo(%{"text" => "Limpar a casa"})
      expected_response = "Limpar a casa"

      assert render_submit(view, "update-item", %{"id" => todo.id, "text" => "Limpar a casa"}) =~ expected_response

      updated_todo = Todo.get_todo!(todo.id)

      assert updated_todo.text == expected_response
    end

    test "Troca de estado", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      {:ok, todo} = Todo.create_todo(%{"text" => "Criar testes unitários"})

      assert todo.status == 0
      assert render_click(view, :toggle, %{"id" => todo.id, "value" => 1}) =~ "completed"

      updated_todo = Todo.get_todo!(todo.id)

      assert updated_todo.status == 1
    end

    test "Deletar um item da lista", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      {:ok, todo} = Todo.create_todo(%{"text" => "Estudar Elixir"})

      assert todo.status == 0

      render_click(view, :delete, %{"id" => todo.id})
      updated_todo = Todo.get_todo!(todo.id)

      assert updated_todo.status == 2
    end

  end


end
