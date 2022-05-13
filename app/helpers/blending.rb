module Blending

  extend ActiveSupport::Concern

  included do
    before_save :do_something, if: :apple_model?
    def apple_model?
      self.class.to_s == 'Apple'
    end
  end


  def do_something
    puts"----------------------do whatever---------------------------------"
  end
  
end
