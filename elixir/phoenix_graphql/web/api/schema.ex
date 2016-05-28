defmodule PhoenixGraphql.Api.Schema do
	use Absinthe.Schema
	import_types PhoenixGraphql.Api.Schema.Types.Post
	import_types PhoenixGraphql.Api.Schema.Types.User
	import_types PhoenixGraphql.Api.Schema.Types.Comment
	alias PhoenixGraphql.Api.Resolver


	query do
	  field :posts, list_of(:post) do
	    resolve fn
	    	(_, _) -> Resolver.all(
	    		%{
	    			model: PhoenixGraphql.Post,
	    			preloaders: [:user, :comments,  [comments: :user]]
	    		}
	    	)
	    end
	  end

    field :post, :post do
      arg :id, non_null(:id)
      resolve fn
        %{id: id}, _ -> Resolver.find(
          %{
            id: id,
            model: PhoenixGraphql.Post,
            preloaders: [:user, :comments, [comments: :user]]
          }
        )
      end
    end

	  field :users, list_of(:user) do
	    resolve fn
	    	(_, _) -> Resolver.all(
	    		%{
	    			model: PhoenixGraphql.User,
	    			preloaders: []
	    		}
	    	)
	    end
	  end

	  field :user, :user do
	    arg :id, non_null(:id)
	    resolve fn
        %{id: id}, _ -> {:ok, PhoenixGraphql.Repo.get(PhoenixGraphql.User, id) |> PhoenixGraphql.Repo.preload([:comments, :posts])}
      end
	  end
	end
end
