Rails.application.routes.draw do
  scope(:path => 'refinery/carousel', :as => 'refinery_admin_carousel', :module => 'refinery/admin/carousel') do
    resources :parts, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
