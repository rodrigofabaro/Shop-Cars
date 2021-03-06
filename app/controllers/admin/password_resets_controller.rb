class Admin::PasswordResetsController < Admin::ApplicationController

	before_filter :load_user_using_perishable_token, :only => [:edit, :update]

	def new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.deliver_password_reset_instructions!
			send_email_password_reset
			flash[:notice] = "Foi enviado por e-mail a instrução de como alterar a sua senha."
			redirect_to (admin_login_path)
		else
			flash[:notice] = "Nenhum usuário com o e-mail informado!"
			render :action => :new
		end
	end

	def edit
	render
	end

	def update
		@user.password = params[:user][:password]
		@user.password_confirmation = params[:user][:password_confirmation]
		if @user.save
			flash[:notice] = "Senha alterada com sucesso!"
			redirect_to edit_admin_user_path(@user)
		else
			render :action => :edit
		end
	end

	private
	def load_user_using_perishable_token
		@user = User.find_using_perishable_token(params[:id])

		if !@user
			flash[:notice] = "Link inválido!"
			redirect_to :controller => "users", :action => "new"
		end
	end

	#Envia email (instruções para recuperar a senha)
	def send_email_password_reset
		corpo = <<-CODE
		Instruções para trocar a senha a senha
		Login: #{@user.login}
		E-mail: #{@user.email}
		Para trocar a senha Link: <a href='#{edit_admin_password_reset_url(@user.perishable_token)}'>clique aqui.</a>
		CODE

		Email.deliver_padrao(:corpo => corpo, :assunto => "Instruções para trocar a senha", :para => @user.email)

	end

end

