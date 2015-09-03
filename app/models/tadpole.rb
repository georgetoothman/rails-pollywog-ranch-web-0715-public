class Tadpole < ActiveRecord::Base
  belongs_to :frog
  has_one :pond, through: :frog
  # delegate :pond, to: :frog ^^same
  # delegate(:pong{to: :frog}) ^^same

  def convert_to_frog
    frog = Frog.create(name: self.name, color: self.color, pond: self.pond)
    self.destroy
    frog
  end
end
