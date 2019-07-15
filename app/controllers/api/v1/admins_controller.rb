class Api::V1::AdminsController < Api::BaseController
  respond_to :json

  def show
    respond_with Admin.find(params[:id])
  end

  def index
    @admins = Admin.all
    render json: {data: @admins}
  end

  def create
    admin = Admin.find_or_initialize_by(email: admin_params['email'])
    if admin.id.nil?
      admin = Admin.new(admin_params)
      unless admin.save(validate: false)
        render json: {status: 'fail', data: admin, message: admin.errors.full_messages.first}
        return
      end
    end
    render json: {status: 'success', data: admin, message: t('verify_your_account')}
  end

  def update
    admin = Admin.find_by(id: params[:id])

    if admin.update(admin_params)
      render json: admin, status: 200, location: [:api, admin]
    else
      render json: {errors: admin.errors}, status: 422
    end
  end

  def destroy
    admin = Admin.find(params[:id])
    admin.destroy
    head 204
  end


  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

end
