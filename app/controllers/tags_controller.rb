# frozen_string_literal: true

class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:id])
    @posts = @tag.posts
    # render formats: :html
  end
end
