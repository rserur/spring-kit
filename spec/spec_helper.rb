require 'paperclip/matchers'
require 'coveralls'
Coveralls.wear!('rails')

RSpec.configure do |config|
   config.include Paperclip::Shoulda::Matchers
end
