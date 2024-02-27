# frozen_string_literal: true

class ApplicationView < Phlex::HTML
  include Phlex::Rails::Helpers::Routes
  include BootstrapForm::ActionViewExtensions::FormHelper
  include Phlex::Rails::Helpers::FormFor
  include Phlex::Rails::Helpers::LinkTo
  include Ransack::Helpers::FormHelper

  def before_template
    comment { "Before #{self.class.name}" }
    super
  end
end
