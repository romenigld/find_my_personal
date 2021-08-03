defmodule FindMyPersonal.Members.Mail do
  import Bamboo.Email

  alias FindMyPersonal.Mail.Mailer
  alias FindMyPersonal.Members.Member

  def created({:ok, %Member{} = member}) do
    new_email(
      to: member.email,
      from: "romenigld@gmail.com",
      subject: "Bem vindo a Academia!!! #{member.name}",
      html_body: "<strong>Obrigado por confiar no nosso time!!!</strong>",
      text_body: "Obrigado!!"
    )
    |> Mailer.deliver_now()
  end
end
