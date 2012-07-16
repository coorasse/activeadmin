require 'active_admin/view_helpers/fields_for'

describe ActiveAdmin::ViewHelpers::FormHelper, ".fields_for" do
  include ActiveAdmin::ViewHelpers::FormHelper

  it "should skip :action, :controller and :commit" do
    fields_for_params(
      scope: "All", action: "index", controller: "PostController", commit: "Filter", utf8: "Yes!").
      should == [ { scope: "All" } ]
  end

  it "should work with hashes" do
    fields_for_params(filters: { name: "John", age: "12" }).
      should == [ { "filters[name]" => "John" }, { "filters[age]" => "12" } ]
  end

  it "should work with nested hashes" do
    fields_for_params(filters: { user: { name: "John" }}).
      should == [ { "filters[user][name]" => "John" } ]
  end

  it "should work with arrays" do
    fields_for_params(people: ["greg", "emily", "philippe"]).
      should == [ { "people[]" => "greg" }, 
                  { "people[]" => "emily" }, 
                  { "people[]" => "philippe" } ]
  end

  it "should work with nested arrays" do
    pending "Not yet...."
    fields_for_params(people: { names: ["greg", "emily", "philippe"] }).
      should == [ { "people[names[]]" => "greg" }, 
                  { "people[names[]]" => "emily" }, 
                  { "people[names[]]" => "philippe" } ]
  end
end
