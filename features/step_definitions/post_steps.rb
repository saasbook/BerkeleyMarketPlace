And /^(?:|I )select "(.*)" from "(.*)"$/ do |value, field|
  select(value, :from => field)
    # select value, :from => field
end

Then /^(?:|I )should see "(.*)" in the field "(.*)"$/ do |val, field|
    expect(find_field(field).value).to eq val
end

Then /^(?:|I )attach the file to "(.*)"$/ do |field|
    attach_file(field, File.join(Rails.root, "public/images/post_default.png"))
end
