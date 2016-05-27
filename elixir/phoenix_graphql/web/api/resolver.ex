defmodule PhoenixGraphql.Api.Resolver do
	alias PhoenixGraphql.Repo

  def find(%{id: id, model: model, preloaders: preloaders}) do
    case model |> model.with_comments |> Repo.get!(id) do
      nil  -> {:error, "No found"}
      object -> {:ok, object}
    end
  end

  def all(%{model: model, preloaders: preloaders}) do
  	case Repo.all(model) |> Repo.preload(preloaders) do
  		nil  -> {:error, "No #{model} found"}
    	collection -> {:ok, collection}
    end
  end
end
