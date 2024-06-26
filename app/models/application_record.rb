class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.paginate_scope page

  end

end
