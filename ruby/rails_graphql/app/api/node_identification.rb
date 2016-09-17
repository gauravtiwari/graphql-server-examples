GraphQL::Relay::GlobalNodeIdentification.instance_variable_set(:@instance, nil)

NodeIdentification = GraphQL::Relay::GlobalNodeIdentification.define do
  # Given a UUID & the query context,
  # return the corresponding application object
  object_from_id ->(id, _ctx) { resolve_object_from_id(id) }
end

private

def resolve_object_from_id(id)
  # "User" -> User.find(id)
  type_name, id = NodeIdentification.from_global_id(id)
  type_name.constantize.find(id)
end
