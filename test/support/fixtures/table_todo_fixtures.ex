defmodule LiveViewTodo.Table_todoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveViewTodo.Table_todo` context.
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
        text: "some text"
      })
      |> LiveViewTodo.Table_todo.create_todo()

    todo
  end
end
