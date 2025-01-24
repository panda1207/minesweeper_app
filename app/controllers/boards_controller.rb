class BoardsController < ApplicationController
  def new
    @board = Board.new
    @recent_boards = Board.order(created_at: :desc).limit(10)
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      @board.generate_board
      @board.save
      redirect_to @board, notice: "Board successfully created!"
    else
      render :new, alert: "Failed to create the board. Please check the inputs."
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def index
    @boards = Board.order(created_at: :desc).page(params[:page]).per(10)
  end

  private

  def board_params
    params.require(:board).permit(:name, :email, :width, :height, :mines)
  end
end
