class Api::V1::StoriesController < Api::V1::BaseController
  def index
    @stories = Story.all
    # render json: @stories #Just for testing
  end

  def show
    @story = Story.find(params[:id])
    # render json: @story #Just for testing
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      render :show
    else
      render_error
    end
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    head :no_content
  end

  private

  def story_params
    params.require(:story).permit(:name, :text)
  end

  def render_error
    render json: { errors: @story.errors.full_messages }, status: :unprocessable_entity
  end
end