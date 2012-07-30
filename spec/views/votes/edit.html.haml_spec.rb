require 'spec_helper'

describe "votes/edit" do
  before(:each) do
    @vote = assign(:vote, stub_model(Vote,
      :post_id => 1,
      :user_id => 1,
      :up_or_down => false
    ))
  end

  it "renders the edit vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => votes_path(@vote), :method => "post" do
      assert_select "input#vote_post_id", :name => "vote[post_id]"
      assert_select "input#vote_user_id", :name => "vote[user_id]"
      assert_select "input#vote_up_or_down", :name => "vote[up_or_down]"
    end
  end
end
