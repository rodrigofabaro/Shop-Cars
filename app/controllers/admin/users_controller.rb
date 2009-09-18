class Admin::UsersController < Admin::ApplicationController

	before_filter :require_no_user, :only => [:new, :create]
	before_filter :require_user, :only => [:show, :edit, :update]

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        send_email_active_user
        flash[:notice] = 'Usuário criado com sucesso. Você receberá um email para ativação do mesmo.'
        format.html { redirect_to admin_logout_path }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to([:admin,@user]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

	def send_email_active_user
		corpo = <<-CODE
		<b>Seu cadastro precisa ser confirmado</b><br />
		<b>Data do cadastro: </b>#{@user.created_at}<br />
		<b>Login: </b>#{@user.login}<br />
		<b>E-mail: </b>#{@user.email}<br />
		<b>Para ativar </b><a href='#{edit_admin_active_user_url(@user.perishable_token)}'>clique aqui.</a>
		CODE

		Email.deliver_padrao(:corpo => corpo, :assunto => "Cadastro Aceito", :para => @user.email)

	end

end

