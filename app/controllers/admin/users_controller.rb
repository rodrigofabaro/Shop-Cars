class Admin::UsersController < Admin::ApplicationController

	before_filter :require_user, :only => [:new, :create, :index, :show, :edit, :update]

  def index
    @users = User.all
  end

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

   def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(admin_users_url) }
      format.xml  { head :ok }
    end
  end




  private

	def send_email_active_user
		corpo = <<-CODE
		Seu cadastro precisa ser confirmado
		Data do cadastro: #{@user.created_at}
		Login: #{@user.login}
		E-mail: #{@user.email}
		Para ativar <a href='#{edit_admin_active_user_url(@user.perishable_token)}'>clique aqui.</a>
		CODE

		Email.deliver_padrao(:corpo => corpo, :assunto => "Cadastro Aceito", :para => @user.email)

	end

end

