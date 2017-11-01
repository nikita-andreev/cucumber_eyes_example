Then /^Create eyes instance$/ do
  $eyes ||= Applitools::Selenium::Eyes.new.tap do |eyes|
    eyes.api_key = ENV['APPLITOOLS_API_KEY']
    eyes.hide_scrollbars = true
    logfile = File.join(Dir.getwd, 'logs', 'applitools.log')
    eyes.log_handler = Logger.new(File.new(logfile, 'w+'))
  end
end

Then /^open eyes \(app_name: "([^"]*)", test_name: "([^"]*)", viewport_size: "([^"]*)"\)$/ do |app, test, viewport_size|
  raise StandardError, 'Eyes are not created!' unless $eyes
  unless $eyes.open?
    vp_size = Applitools::RectangleSize.from_any_argument(viewport_size).tap do |s|
      s.width = s.width.to_i
      s.height = s.height.to_i
    end
    $eyes.open(app_name: app, test_name: test, viewport_size: vp_size, driver: page)
  end
end

Then /^close eyes$/ do
  @test_results = $eyes.close(true)
end

Then /^all tests should be successful$/ do
  step %(close eyes)
  puts @test_results
end