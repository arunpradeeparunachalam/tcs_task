class ApplesController < ApplicationController
  before_action :set_apple, only: %i[ show edit update destroy ]

  # GET /apples or /apples.json
  def index
    @apples = Apple.all
  end

  # GET /apples/1 or /apples/1.json
  def show
  end

  # GET /apples/new
  def new
    @apple = Apple.new
  end

  # GET /apples/1/edit
  def edit
  end

  # POST /apples or /apples.json
  def create
    @apple = Apple.new(apple_params)

    respond_to do |format|
      if @apple.save
        format.html { redirect_to apple_url(@apple), notice: "Apple was successfully created." }
        format.json { render :show, status: :created, location: @apple }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apple.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apples/1 or /apples/1.json
  def update
    respond_to do |format|
      if @apple.update(apple_params)
        format.html { redirect_to apple_url(@apple), notice: "Apple was successfully updated." }
        format.json { render :show, status: :ok, location: @apple }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apple.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apples/1 or /apples/1.json
  def destroy
    @apple.destroy

    respond_to do |format|
      format.html { redirect_to apples_url, notice: "Apple was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apple
      @apple = Apple.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apple_params
      params.fetch(:apple, {})
    end
end
