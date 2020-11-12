class Event < ApplicationRecord
  belongs_to :actor, dependent: :destroy # it can orphan events which associate with this destroyed actors or repos
  belongs_to :repo, dependent: :destroy

  after_save :handle_streak

  # def as_json
  #   hash = super(only: [:id, :event_type], include: { actor: {}, repo: {} })
  #   hash["type"] = hash.delete("event_type")
  #   hash['created_at'] = created_at.to_s
  #   hash
  # end

  def handle_streak
    max_streak = actor.streak
    dates = actor.events.order(:created_at).pluck('date(events.created_at)').uniq
    n = dates.length
    i = 1
    while i < n
      current_streak = 1
      while i < n && (0..1).include?((dates[i].to_date - dates[i-1].to_date).to_i)
        i += 1
        current_streak += 1
      end
      i += 1
      max_streak = [max_streak, current_streak].max
    end
    actor.update(streak: max_streak) if actor.streak < max_streak 
  end

end
