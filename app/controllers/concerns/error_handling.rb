module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private

    def notfound
      # render file: 'public/404.html', status: :not_found, layout: false
      redirect_to root_path, danger: 'The page you were looking for does not exist'
    end
  end
end
