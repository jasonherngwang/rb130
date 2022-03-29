def organize_birds(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)

# Block, not method, determines how array is destructured.
organize_birds(birds) do |_, _, *raptors|
  puts raptors
end