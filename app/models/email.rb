class Email < ActionMailer::Base

  def padrao(options = {})

    email = "rodrigo.engenharia@gmail.com"
    recipients options[:para] || ""
    from options[:from] || email
    subject options[:assunto]  || ""
    reply_to options[:responder] || email
    body :corpo => options[:corpo] || email
  end

end

