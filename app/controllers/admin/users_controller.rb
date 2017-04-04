class Admin::UsersController < BaseAdminController
	def index
    @filter = params[:filter]
		@user_count = User.count

    if @filter
      if @filter == "latest"
        @users = User.order("created_at DESC").page(params[:page])
			elsif @filter == "num_words"
				@users = User.order("user_words_count DESC")
										 .page(params[:page])
			elsif @filter == "alpha"
				@users = User.order("username ASC")
										 .page(params[:page])
      end
    else
      @users = User.order("created_at DESC").page(params[:page])
    end
  end
end
