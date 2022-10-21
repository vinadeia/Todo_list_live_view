defmodule LiveViewTodo.Table_todoTest do
  use LiveViewTodo.DataCase

  alias LiveViewTodo.Table_todo

  describe "todos" do
    alias LiveViewTodo.Table_todo.Todo

    import LiveViewTodo.Table_todoFixtures

    @invalid_attrs %{person_id: nil, status: nil, text: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Table_todo.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Table_todo.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{person_id: 42, status: 42, text: "some text"}

      assert {:ok, %Todo{} = todo} = Table_todo.create_todo(valid_attrs)
      assert todo.person_id == 42
      assert todo.status == 42
      assert todo.text == "some text"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Table_todo.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{person_id: 43, status: 43, text: "some updated text"}

      assert {:ok, %Todo{} = todo} = Table_todo.update_todo(todo, update_attrs)
      assert todo.person_id == 43
      assert todo.status == 43
      assert todo.text == "some updated text"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Table_todo.update_todo(todo, @invalid_attrs)
      assert todo == Table_todo.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Table_todo.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Table_todo.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Table_todo.change_todo(todo)
    end
  end
end
