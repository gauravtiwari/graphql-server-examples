NodeIdentification = GraphQL::Relay::GlobalNodeIdentification.define do
  object_from_id -> (id, ctx) do
    type_name, id = NodeIdentification.from_global_id(id)
    Object.const_get(type_name).find(id)
  end

  type_from_object -> (object) do
    Schema.types[type_name(object)]
  end
end

def type_name(object)
  object.class.name
end
