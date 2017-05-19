object @rate
attributes :id, :code, :category, :min_age, :max_age, :bonus, :total

# Static values
node(:fosyga) {|rate| rate.fosyga}
node(:runt) {|rate| rate.runt}
