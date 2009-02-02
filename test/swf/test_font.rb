require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module SWF
  class TestFont < Ketama::TestCase
    def test_load_from_file
      assert font = Ketama::SWF::Font.open(
        File.join(ASSETS, 'font01.fdb')
      )
    end
  end
end
