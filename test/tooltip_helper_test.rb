require File.dirname(__FILE__) + '/test_helper'

class TooltipHelperTest < ActionView::TestCase
  attr_accessor :params
  include Widgets::TooltipHelper
  
  def setup
    @params = {}
  end
    
  def test_presence_of_instance_methods
    %w{tooltip}.each do |instance_method|
      assert respond_to?(instance_method), "#{instance_method} is not defined after including the helper" 
    end     
  end    
  
  def test_tooltip_link_function
    expected = "$('tooltip_link_one').observe('click', function(event){toggleTooltip(event, $('tooltip_one'))});"   
    assert_equal expected.strip, tooltip_link_function(:one);
  
    expected = "$('tooltip_link_two').observe('click', function(event){toggleTooltip(event, $('tooltip_two'))});"   
    assert_equal expected.strip, tooltip_link_function(:two);
  end
  
  def test_close_tooltip_link
    expected = "<a href=\"#\" onclick=\"$(&#x27;tooltip_first&#x27;).hide(); return false;\">close</a>"   
    assert_equal expected.strip, close_tooltip_link(:first);
    
    expected = "<a href=\"#\" onclick=\"$(&#x27;tooltip_second&#x27;).hide(); return false;\">chiudi</a>"   
    assert_equal expected.strip, close_tooltip_link(:second, 'chiudi');
  end
 
end
