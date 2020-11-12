class EventSerializer < ActiveModel::Serializer
  attributes :id,
             :type,
             :actor,
             :repo,
             :created_at

  def type
    object.event_type
  end

  def actor
    ActorSerializer.new(object.actor).attributes
  end

  def repo
    object.repo.as_json
  end

end
