require File.expand_path('../../test_helper', __FILE__)
require 'tempfile'

module Plotlyrb
  class PlotImageTest < Test::Unit::TestCase
    def test_get_image
      plotly = Plotlyrb::ApiV2.auth_plotly(USERNAME, API_KEY)
      data = {:figure => {
                :data => [{:x => [1,2,3], :y => [2,4,6], :type => 'scatter'}],
                :layout => {:xaxis => {:title => 'one-two-three'}, :yaxis => {:title => 'two-four-six'}}
              },
              :format => :png
             }
      tmp_file = Tempfile.new('get_image_test').path
      plotly.plot_image(data, tmp_file)
      assert(FileUtils.identical?("#{File.dirname(__FILE__)}/../fixtures/get_test.png", tmp_file), 'File returned should be same')
    end
  end
end
