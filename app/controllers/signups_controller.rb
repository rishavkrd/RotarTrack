class SignupsController < ApplicationController
  before_action :set_signup, only: %i[ show edit update destroy ]

  # GET /signups or /signups.json
  def index
    @signups = Signup.all
  end

  # GET /signups/1 or /signups/1.json
  def show
  end

  # GET /signups/new
  def new
    @signup = Signup.new
  end

  # GET /signups/1/edit
  def edit
  end

  # POST /signups or /signups.json
  def create
    @signup = Signup.new(signup_params)
    @eventTime = signup_params[:Time]
    @cutoffTime = Time.now + 43200
    respond_to do |format|
      if (@signup.save && (@cutoffTime && @cutoffTime > @eventTime))
        format.html { redirect_to signup_url(@signup), notice: "Signup was successfully created." }
        format.json { render :show, status: :created, location: @signup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signups/1 or /signups/1.json
  def update
    respond_to do |format|
      if @signup.update(signup_params)
        format.html { redirect_to signup_url(@signup), notice: "Signup was successfully updated." }
        format.json { render :show, status: :ok, location: @signup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signups/1 or /signups/1.json
  def destroy
    @signup.destroy

    respond_to do |format|
      format.html { redirect_to signups_url, notice: "Signup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup
      @signup = Signup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def signup_params
      params.require(:signup).permit(:event_id, :account_id, :Pickup)
    end
end
