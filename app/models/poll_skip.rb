class PollSkip < ApplicationRecord
  belongs_to :poll
  belongs_to :user

  validate :one_vote_per_poll_per_user

  private

  def one_vote_per_poll_per_user
    errors.add(:base, "cannot vote more than once in one poll") if poll.poll_votes.where(user_id: user_id).exists? || poll.poll_skips.where(user_id: user_id).exists?
  end
end
