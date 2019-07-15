class Api::V1::VerificationsController < Api::BaseController
  def verify
    @user = User.find_by(mobile_number: params[:user][:mobile_number])
    if @user.present?
      if params[:user][:verification_code].present? && (params[:user][:verification_code] == @user.verification_code)
        @user.unlock_user
        render json: {data: @user, status: 'success', message: t(:verified_successfully)}
      else
        render json: {status: 'fail', message: t(:wrong_code)}
      end
    else
      render json: {message: 'user not found', status: 'fail',message: t('not_found')}
    end
  end
end
