class ParsedLogController < ApplicationController

  def show
    @log = ParsedLog.last
  end

end
