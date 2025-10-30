class Content::Article < Perron::Resource
  delegate :title, :description, to: :metadata

  validates :title, :description, presence: true
end
