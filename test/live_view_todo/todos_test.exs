defmodule LiveViewTodo.TodosTest do
  use LiveViewTodo.DataCase
  alias LiveViewTodo.Todo

    # Teste gerado de forma automática pelo Framework Phoenix, foi necessário alguns ajustes para os testes passarem.
    # Não consegui executar sem erro a função delete_todo.

  describe "todos" do
    alias LiveViewTodo.Todo
    import LiveViewTodo.TodosFixtures

    @invalid_attrs %{status: nil, person_id: nil, text: nil}

    test "list_todo/0 returns all todo" do
      todo = todo_fixture()
      assert Todo.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Todo.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{status: 42, person_id: 42, text: "some title"}

      assert {:ok, %Todo{} = todo} = Todo.create_todo(valid_attrs)
      assert todo.person_id == 42
      assert todo.status == 42
      assert todo.text == "some title"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todo.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{status: 42, person_id: 42, text: "some title"}

      assert {:ok, %Todo{} = todo} = Todo.update_todo(todo, update_attrs)
      assert todo.person_id == 42
      assert todo.status == 42
      assert todo.text == "some title"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Todo.update_todo(todo, @invalid_attrs)
      assert todo == Todo.get_todo!(todo.id)
    end

    # Erro ao deletar ----
    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Todo.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Todo.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Todo.change_todo(todo)
    end
  end
end
