module Widgets
  class Tab
    include Highlightable
    attr_accessor :link, :name, :html
    
    def initialize(opts={})
      @name = opts[:name] 
      @link = opts[:link] || {}
      highlights = opts[:highlights] || []
      @html = opts[:html] || {} 
      @html[:title] = opts[:title] 
     
      yield(self) if block_given?
      
      highlights << @link if link? # it does highlight on itself
      raise ArgumentError, 'you must provide a name' unless @name
    end
    
    # title is a shortcut to html[:title]
    def title; @html[:title]; end
    def title=(new_title); @html[:title]=new_title; end
    
    def link?
      @link && !@link.empty?
    end
       
  end
end