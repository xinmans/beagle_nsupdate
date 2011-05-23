class Zone
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :description, :type => String

  belongs_to :group, :inverse_of => :zones

  validates_presence_of :name
  validates_uniqueness_of :name

  accepts_nested_attributes_for :group, :reject_if => lambda {|attrs| attrs[:name].blank? || attrs.all? {|k, v| v.blank? } }
end
