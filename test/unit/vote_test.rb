require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  fixtures :users, :proposals
  # Replace this with your real tests.
  def test_create
    v = Vote.new
    v.proposal = proposals(:default)
    v.user = users(:default)

    assert v.save
  end

  def test_create_invalid
    v = Vote.new
    v.proposal = proposals(:default)
    v.user = users(:default)
    
    assert v.save

    v = Vote.new
    v.proposal = proposals(:default)
    v.user = users(:default)
    
    assert !v.save

    v = Vote.new
    v.proposal = proposals(:two)
    v.user = users(:default)
    
    assert v.save
  end
    
end
