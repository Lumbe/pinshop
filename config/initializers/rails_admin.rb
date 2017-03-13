RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  # config.model Product do
  #   configure :image, :jcrop

  #   edit do
  #     configure :image do
  #       jcrop_options aspectRatio: 420.0/512.0
  #     end
  #   end
  # end

  config.model Product do
    configure :image, :jcrop

    edit do
      configure :description, :ck_editor
      configure :image do
        jcrop_options aspectRatio: 420.0/512.0
      end
      configure :sizes do
        partial 'select_sizes'
      end
      configure :genders do
        partial 'select_genders'
      end
      exclude_fields :image_variants
    end
  end

  config.model ImageVariant do
    configure :image, :jcrop

    edit do
      configure :image do
        jcrop_options aspectRatio: 420.0/512.0
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    dropzone do
      only Product
    end
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
