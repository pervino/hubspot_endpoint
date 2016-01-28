module Fixtures
  def load_fixture(name)
    IO.read(File.join(File.dirname(__FILE__), '..', 'fixtures', "#{name}.json"))
  end
end

module FactoryRequests
  extend Fixtures

  class << self
    def contact
      JSON.parse(load_fixture('contact_request'))
    end
  end
end

module FactoryResponses
  extend Fixtures

  class << self

  end
end