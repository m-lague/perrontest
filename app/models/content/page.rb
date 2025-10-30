class Content::Page < Perron::Resource
  delegate :title, :description, to: :metadata
end
