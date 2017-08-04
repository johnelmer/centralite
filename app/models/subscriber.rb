class Subscriber
  include Mongoid::Document
  field :lastName, type: String
  field :firstName, type: String
  field :middleName, type: String
  field :contactNumber, type: String
  field :idNumber, type: String
  field :controlNumber, type: String
  field :course, type: String
  field :college, type: String
  field :email, type: String
  field :description, type: String
  field :pictorial, type: Date
  field :birthday, type: Date
  field :suffix, type: String
  field :fathersName, type: String
  field :mothersName, type: String
  field :typeOfSubscription, type: String
  field :isProofreadByLayout, type: Mongoid::Boolean
  field :isProofreadByManaging, type: Mongoid::Boolean
  field :isProofreadByAssociate, type: Mongoid::Boolean
  field :isProofreadByEIC, type: Mongoid::Boolean
  field :isProofreadByModerator, type: Mongoid::Boolean
  field :semGraduating, type: String

  validates_presence_of :firstName, :idNumber, :college, :course
  validates_uniqueness_of :idNumber, :controlNumber
  validates_format_of :idNumber, with: /\d{2}\-\d{4}\-\d{2}/
end
