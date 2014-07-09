require 'rails_helper'

describe Post do
  it { should belong_to(:sender).class_name('User') }
  it { should belong_to(:recipient).class_name('User') }

  it { should_not have_valid(:sender_id).when(nil) }
  it { should_not have_valid(:recipient_id).when(nil) }
  it { should_not have_valid(:body).when(nil) }

  it { should have_valid(:title).when(nil) }
end
