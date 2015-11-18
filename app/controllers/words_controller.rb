class WordsController < ApplicationController
  # before_action :set_course

  def index
    @course =  Course.find(params[:course_id])
    # TO CHECK => Only take the score from current_user?
    @word = current_user.words.where(course_id: @course.id).includes(:scores).order("scores.score DESC").first
    @answers = ['Réponse parfait', 'Bonne réponse avec hésitation', 'bonne réponse avec difficulté', 'mauvaise réponse; où la bonne semblait facile à retenir', 'Mauvaise réponse', 'black-out total']
  end

  def create
    @word = Word.new(word_params)
    @word.score = 1
    @word.save
  end

  def update_word_score
    @course = Course.find(params[:course_id])
    level = params[:level]
    @word = Word.find(params[:id])
    score = @word.scores.where(user: current_user).first
    score.score = update_score(@word, level)
    score.save
    redirect_to course_words_path(@course)
  end

  private

  def update_score(word, level)
    level_score = calculate_level_score(level)
    increment_others(word)
    word.scores.where(user: current_user).first.score += level_score
  end

  def increment_others(word)
    words_array = @course.words
    max = current_user.scores.where(word: words_array).pluck(:score).max
    words_array.each do |word_array|
      if word != word_array
        word_score = word_array.scores.where(user: current_user).first_or_create
        word_score.score == 0 ? word_score.score = max + 1 :  word_score.score += 1
        word_score.save
      end
    end
  end

  def calculate_level_score(level)
    case level.to_i
    when 0
      score = 0.8
    when 1
      score = 0.54
    when 2
      score = 0.32
    when 3
      score = 0.14
    when 4
      score = 0
    when 5
      score = -0.1
    end
    score
  end

  def word_params
      params.require(:word).permit(:word, :traduction, :course_id, :user_id)
  end
end
