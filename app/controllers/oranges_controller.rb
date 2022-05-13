class OrangesController < ApplicationController
  before_action :set_orange, only: %i[ show edit update destroy ]

  # GET /oranges or /oranges.json
  def index
    @oranges = Orange.all
  end

  # GET /oranges/1 or /oranges/1.json
  def show
  end

  # GET /oranges/new
  def new
    @orange = Orange.new
  end

  # GET /oranges/1/edit
  def edit
  end

  # POST /oranges or /oranges.json
  def create
    @orange = Orange.new(orange_params)

    respond_to do |format|
      if @orange.save
        format.html { redirect_to orange_url(@orange), notice: "Orange was successfully created." }
        format.json { render :show, status: :created, location: @orange }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orange.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oranges/1 or /oranges/1.json
  def update
    respond_to do |format|
      if @orange.update(orange_params)
        format.html { redirect_to orange_url(@orange), notice: "Orange was successfully updated." }
        format.json { render :show, status: :ok, location: @orange }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orange.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oranges/1 or /oranges/1.json
  def destroy
    @orange.destroy

    respond_to do |format|
      format.html { redirect_to oranges_url, notice: "Orange was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orange
      @orange = Orange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orange_params
      params.fetch(:orange, {})
    end
end
