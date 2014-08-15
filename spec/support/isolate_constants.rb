# Constants (classes, etc) defined within a block passed to this method
# will be removed from the global namespace after the block as run.
def isolate_constants
  existing_constants = Object.constants
  yield
ensure
  (Object.constants - existing_constants).each do |constant|
    Object.send(:remove_const, constant)
  end
end
