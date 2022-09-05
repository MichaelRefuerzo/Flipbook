class FlipbooksController < ProtectedController
  layout :resolve_layout

  before_action :set_flipbook, only: %i[ show edit update destroy ]

  # GET /flipbooks
  def index
    @flipbooks_1 = Flipbook.where(year_level: "1st Year").in_batches(of: 3)
    @flipbooks_2 = Flipbook.where(year_level: "2nd Year").in_batches(of: 3)
    @flipbooks_3 = Flipbook.where(year_level: "3rd Year").in_batches(of: 3)
    @flipbooks_4 = Flipbook.where(year_level: "4th Year").in_batches(of: 3)
    @flipbooks_5 = Flipbook.where(year_level: "Professional Elective Courses").in_batches(of: 3)
    @flipbooks_6 = Flipbook.where(year_level: "Track 1: Animation And Mobile App Development").in_batches(of: 3)
    @flipbooks_7 = Flipbook.where(year_level: "Track 2: Cyber Security").in_batches(of: 3)
    @flipbooks_8 = Flipbook.where(year_level: "Track 3: Digital Arts And Design").in_batches(of: 3)
  end

  # GET /flipbooks/1
  def show
  end

  # GET /flipbooks/new
  def new
    @flipbook = Flipbook.new
  end

  # GET /flipbooks/1/edit
  def edit
  end

  # POST /flipbooks
  def create
    @flipbook = Flipbook.new(flipbook_params)

    if @flipbook.save
      redirect_to @flipbook, notice: "Flipbook was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flipbooks/1
  def update
    if @flipbook.update(flipbook_params)
      redirect_to @flipbook, notice: "Flipbook was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /flipbooks/1
  def destroy
    @flipbook.destroy
    redirect_to flipbooks_url, notice: "Flipbook was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flipbook
      @flipbook = Flipbook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flipbook_params
      params.require(:flipbook).permit(:title, :subtitle, :description, :year_level, :thumbnail, :url, :pdf)
    end

    def resolve_layout
      action_name == 'show' ? false : 'application'
    end
end
