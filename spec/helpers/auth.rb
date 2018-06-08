module AuthHelpers
  def visit_auth(path)
    visit "http://archie:password@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end
end
