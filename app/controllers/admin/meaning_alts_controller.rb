class Admin::MeaningAltsController < BaseAdminController
	def index
    @filter = params[:filter]
		@meaning_alts_count = MeaningAlt.count

    if @filter
      if @filter == "latest"
        @meaning_alts = MeaningAlt.includes(:word, :user)
																	.order("created_at DESC")
																	.page(params[:page])
      end
    else
      @meaning_alts = MeaningAlt.includes(:word, :user)
																.order("words.name ASC")
																.page(arams[:page])
    end
  end
end
