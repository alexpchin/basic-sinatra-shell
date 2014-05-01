# encoding: utf-8
["sinatra"].each { |package| require package }
["minify_resources"].each { |package| require_relative package }
if development?
  ["sinatra/reloader" , "pry"].each { |package| require package }
end

#Classic Sinatra Application
# get "/" do
# 	puts "Hello"
# end

#Modular Sinatra Application
class MyApp < Sinatra::Application
	enable :sessions

	configure :production do
		set :clean_trace, true
		set :css_files, :minified
		set :js_files,  :minified
		MinifyResources.minify_all
	end

	configure :development do
		set :css_files, MinifyResources::CSS_FILES
		set :js_files,  MinifyResources::JS_FILES
	end

	helpers do
		include Rack::Utils
		# Now you can escape HTML in your templates like this:
		# <%= h scary_output %>
		# alias_method :h, :escape_html
	end
end

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'