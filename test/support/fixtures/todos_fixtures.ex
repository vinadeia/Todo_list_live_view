defmodule LiveViewTodo.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveViewTodo.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        person_id: 42,
        status: 42,
        text: "some title"
      })
      |> LiveViewTodo.Todo.create_todo()

    todo
  end
end
