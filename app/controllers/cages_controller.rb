# frozen_string_literal: true

class CagesController < ApplicationController
  before_action :set_cage, only: %i[show update destroy]

  # GET /cages
  def index
    @cages = Cage.all

    render json: @cages
  end

  # GET /cages/1
  def show
    render json: { cage: @cage, dinosaurs: @cage.dinosaurs, dinosaur_count: @cage.dinosaur_count }
  end

  # POST /cages
  def create
    @cage = Cage.new(cage_params)

    if @cage.save
      render json: @cage, status: :created, location: @cage
    else
      render json: @cage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cages/1
  def update
    if @cage.has_dinosaurs? && cage_params[:power_status] == 'down'
      @cage.errors.add(:base, 'Cannot power down cage with dinosaurs in it.')
      render json: @cage.errors, status: :unprocessable_entity
    elsif @cage.update(cage_params)
      render json: @cage
    else
      render json: @cage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cages/1
  def destroy
    if @cage.has_dinosaurs?
      @cage.errors.add(:base, 'Cannot power down cage with dinosaurs in it.')
      render json: @cage.errors, status: :unprocessable_entity
    else
      @cage.destroy
    end
  end

  private

  def set_cage
    @cage = Cage.find(params[:id])
  end

  def cage_params
    params.require(:cage).permit(:power_status, :capacity)
  end
end
