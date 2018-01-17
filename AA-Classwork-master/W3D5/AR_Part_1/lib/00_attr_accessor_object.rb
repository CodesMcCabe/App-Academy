class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method("#{name}") do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |arg| #cody => ':cody='
        instance_variable_set("@#{name}", arg)
      end
    end

    # my_attr_accessor :cody

    # def cody
    #   @cody
    # end



    # define_method(:names) do
    # names.each do |name|
    #   define_method(name) do
    #     self.instance_variable_set(:@name)
    #     name.instance_variable_get(:@name)
    #   end
    # end
  end
end
#
# attr_accessor :name
#
# def name=(name)
#   @name = name
# end
