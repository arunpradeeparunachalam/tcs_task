class CreateApples < ActiveRecord::Migration[6.1]
  def change
    create_table :apples do |t|
      t.string :variety
      t.integer :basket_id
      t.timestamps
    end
  end
end


# class Appl

#   attr_reader :variety, :origin, :history
#   def initialize(**args)
#     @variety = args[:variety]
#     @origin = args[:origin]
#     @history = args[:history]
#   end
# end

# apple = Appl.new(variety: 'Honeycrisp', origin: 'Minnesota', history: 'Introduction to Market: 1991')

# class Appl

#   attr_reader :variety, :origin, :history
#   def initialize(**args)
#     @variety = args[:variety]
#     @origin = args[:origin]
#     @history = args[:history]
#   end
# end

# Marshal.dump(apple)