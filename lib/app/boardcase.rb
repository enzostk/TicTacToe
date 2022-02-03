class BoardCase

    attr_accessor :value , :position
  
    def initialize (position)
      @value = ""
      @position = position
    end

    def to_s
        self.value = @value
    end
    
end
  