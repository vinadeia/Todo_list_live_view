defmodule LiveViewTodo.Todo do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset
  alias __MODULE__
  alias LiveViewTodo.Repo
  alias LiveViewTodo.Todo

  schema "todos" do
    field :person_id, :integer
    field :status, :integer, default: 0
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:text, :person_id, :status])
    |> validate_required([:text])
  end

  def create_todo(attrs \\ %{}) do
    %Todo{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def get_todo!(id), do: Repo.get!(Todo, id)

  def list_todos do
    Todo
    |> order_by(desc: :inserted_at)
    |> where([a], is_nil(a.status) or a.status != 2)
    |> Repo.all()
  end

  def update_todo(%Todo{} = todo, attrs) do
    todo
    |> Todo.changeset(attrs)
    |> Repo.update()
  end

  def delete_todo(id) do
    get_todo!(id)
    |> Todo.changeset(%{status: 2})
    |> Repo.update()
  end

  def change_todo(%Todo{} = todo, attrs \\ %{}) do
    Todo.changeset(todo, attrs)
  end

  def clear_completed() do
    completed_todos = from(i in Todo, where: i.status == 1)
    Repo.update_all(completed_todos, set: [status: 2])
  end
end
