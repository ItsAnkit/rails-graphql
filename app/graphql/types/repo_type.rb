module Types
  class RepoType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :url, String, null: false
  end
end
