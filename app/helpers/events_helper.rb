# frozen_string_literal: true

module EventsHelper
  def convertBool(boolean) # rubocop:todo Naming/MethodName, Style/InlineComment
      boolean ? 'Yes' : 'No' # rubocop:todo Layout/IndentationWidth, Style/InlineComment
  end
end
