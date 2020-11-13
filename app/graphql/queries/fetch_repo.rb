class Queries::FetchRepo < Queries::BaseQuery
  type [Types::RepoType], null: false
  argument :id, ID, required: true

  def resolve(id:)
    Repo.where(id: id)
  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new('Repo not found!')
  rescue ActiveRecord::RecordInvalid => err
    GraphQL::ExecutionError.new('Invalid attributes passed.')
  end

end