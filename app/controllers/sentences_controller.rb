class SentencesController < ApplicationController
  def new
    @story = Story.find(params[:story_id])
    @sentence = @story.sentences.new
    render :new
  end

  def create
    @story = Story.find(params[:story_id])
    @sentence = @story.sentences.new(sentence_params)
    if @sentence.save
      redirect_to story_sentence_path(@story.id, @sentence.id)
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:story_id])
    @sentence = @story.sentences.find(params[:id])
    redirect_to story_path(@story.id)
  end

  def edit
    @story = Story.find(params[:story_id])
    @sentence = @story.sentences.find(params[:id])
    render :edit
  end

  def update
    @story = Story.find(params[:story_id])
    @sentence = @story.sentences.find(params[:id])
    if @sentence.update(sentence_params)
      redirect_to story_path(@story.id)
    else
      render :edit
    end
  end

  private
  def sentence_params
    params.require(:sentence).permit(:sentence, :author, :image)
  end
end