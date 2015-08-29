class ConvnetimageResult < ActiveRecord::Base
  belongs_to :convnetimage

  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :convnetimage, :image, presence: true

  def state
    response["state"] || "NOT SENT YET"
  end

  def response_id
    response["id"]
  end

  def labels
    response["results"] &&
    response["results"]["predictions"][0]["output"][0]["labels"] ||
    []
  end

  def response
    JSON.parse(super || '{}')
  end
end
