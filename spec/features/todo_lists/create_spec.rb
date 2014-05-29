require 'spec_helper'

describe 'Creating Todo Lists' do

	def create_todo_list(options={}) 
		options[:title] ||= "My todo list"
		options[:descripition] ||= "This is my todo list."

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:descripition]
		click_button "Create Todo list"
	end

	it 'redirects to the todo list index page on success' do
		create_todo_list
		expect(page).to have_content("My todo list")
	end

	it 'displays error when todo list has no title' do
		expect(TodoList.count).to eq(0)

		create_todo_list title: ""

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is what I'm doing today.") 
	end

	it 'displays error when todo list title has less than 3 characters' do
		expect(TodoList.count).to eq(0)

		create_todo_list title: "hi"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is what I'm doing today.") 
	end

	it 'displays error when todo list descripition has no descripition' do
		expect(TodoList.count).to eq(0)

		create_todo_list title: "Grocery List", descripition: ""

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Grocery List") 
	end

	it 'displays error when todo list descripition has less than 5 characters' do
		expect(TodoList.count).to eq(0)

		create_todo_list title: "Grocery List", descripition: "Food"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Grocery List") 
	end
end