class DocsController < ApplicationController
  def index
    render file: Rails.root.join("public/api-docs/index.html")
  end
end