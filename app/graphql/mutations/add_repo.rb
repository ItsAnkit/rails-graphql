class Mutations::AddRepo < Mutations::BaseMutation
  argument :params, Types::Input::RepoInputType, required: true
  field :repo, Types::RepoType, null: false

  def resolve(params:) # must return a has whose symbol matches field name
    repo_params = Hash params
    begin
      repo = Repo.create!(repo_params)
      { repo: repo }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new('Invalid Record')
    end
  end
end