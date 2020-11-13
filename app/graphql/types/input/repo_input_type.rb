module Types
  module Input
    class RepoInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :url, String, required: true
    end
  end
end