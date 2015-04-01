module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )follow "([^\"]*)"(?: within "([^\"]*)")?$/ do |link, selector|
  with_scope(selector) do
    click_link(link)
  end
end

Then /^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Then /^I should see an HTML table with at least column: "([^\"]*)" and row: "([^\"]*)"$/ do |column, row|
  page.should have_content(column)
  page.should have_content(row)
end

And /^I click on the button "([^\"]*)"$/ do |cell|
  click_button(cell)
end


Then /^I should see HE at "([^\"]*)"$/ do |cell|
  button = page.find_button(cell)
  expect(button.value).to eq "HE"
end
