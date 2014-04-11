class MessagebusEmailDelegator < SimpleDelegator
  def multipart?
    true
  end

  def html_part
    super || __getobj__
  end
end