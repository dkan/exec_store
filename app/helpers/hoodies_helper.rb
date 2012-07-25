module HoodiesHelper
    
    def primary
       ['Green', 'Blue', 'Yellow', 'Red', 'Black'] 
    end
    
    def secondary
        ['Green', 'Blue', 'Yellow', 'Red', 'Pink', 'Purple']
    end
    
    def size
        ['XS', 'Small', 'Medium', 'Large', 'XL']
    end
        
    def options_with_colors(colors)
        
      @options = colors.collect do |color, code| 
        "<option value='#{code}' style='background-color:#{code};'>#{color}</option> "
      end

    end
    
end