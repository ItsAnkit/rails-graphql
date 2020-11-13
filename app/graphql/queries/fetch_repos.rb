class Queries::FetchRepos < Queries::BaseQuery
  type [Types::RepoType], null: false

  def resolve
    Repo.all.order(created_at: :desc)
  end
end