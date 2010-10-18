
class AssociationPresenceValidator < ActiveModel::EachValidator
  def validate_each(record, attr, value)
    unless value.present?
      record.errors[attr] << (options[:message] || "can't be blank")
    end
  end
end

