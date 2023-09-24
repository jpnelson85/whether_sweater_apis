class ErrorSerializer
  def initialize(errors)
    @errors = errors
  end

  def serialize
    {
      errors: [
        {
          error: @errors[:status],
          status: @errors[:message]
        }
      ]
    }
end