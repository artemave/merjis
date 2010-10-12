class OpenidAssociation < OpenidAbstract
  def secret
    Base64.decode64 read_attribute(:secret)
  end

  def secret=(s)
    write_attribute(:secret, Base64.encode64(s))
  end
end
