# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def template(&block)
    doctype

    html do
      head do
        title { "Ahmet Sait İnce | Fenerbahçe" }
        meta name: 'viewport', content: 'width=device-width,initial-scale=1'
        csp_meta_tag
        csrf_meta_tags
        stylesheet_link_tag 'application', data_turbo_track: 'reload'
        javascript_importmap_tags
        link(
          rel: 'stylesheet',
          href:
            'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css',
          integrity:
            'sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==',
          crossorigin: 'anonymous',
          referrerpolicy: 'no-referrer'
        )
      end

      body do
        render NavbarComponent.new
        main(&block)
      end
    end
  end
end
