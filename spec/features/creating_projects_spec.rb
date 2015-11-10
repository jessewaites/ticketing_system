require 'spec_helper'

feature "Creating Projects" do
  scenario "can create a project" do
  	visit "/"

  	click_link "New Project"

  	fill_in "Name", with: "Test Project"
  	fill_in "Description", with: "Project Description"
  	click_button "Create Project"

  	expect(page).to have_content("Project has been created.")

  	project = Project.where(name: "Test Project").first

	expect(page.current_url).to eql(project_url(project))
  end

  scenario "can not create a project without a name" do
    visit '/'
    click_link 'New Project'
    click_button 'Create Project'
    expect(page).to have_content("Project has not been created.")
    expect(page).to have_content("Name can't be blank")
  end

end 