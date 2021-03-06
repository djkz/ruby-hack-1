require "hangman/game"

class WelcomeController < ApplicationController
  before_filter :load_game_from_session
  def index
  end

  def guess
    begin
      @game.guess!(params[:id])
    rescue Game::PlayerWins
      session[:game] = Game.new(load_words)
    rescue Game::PlayerLoses
      session[:game] = Game.new(load_words)
    rescue Game::AlreadyPlayed
      flash[:error] = "This letter has already been played"
      render :index and return
    else
      render :index and return
    end
  end

  def load_game_from_session
    if session[:game].present?
     @game = session[:game]
    else
      session[:game] = Game.new(load_words)
      @game = session[:game]
    end
  end

  def load_words
    words = []
    word_file = File.open("lib/hangman/words.txt","r") do |line|
      while (word = line.gets)
        words << word
      end
    end
    words
  end
end
