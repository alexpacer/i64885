class Identity < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }
  validates :provider, presence: true

  def self.find_for_oauth(auth)
    identity = find_by(provider: auth.provider, uid: auto.uid)
    if identity.nil?
      identity = reate(:uid: auth.uid, provider: auth.provider)
    end
    identity
  end

end
