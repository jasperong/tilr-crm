class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :load_user
  helper_method :sort_column, :sort_direction

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = @user.contacts
                      .page(params[:page]).per_page(12)
                      .reorder("#{sort_column} #{sort_direction}")
                      .search(params[:search])

    respond_to do |format|
      format.html
      format.json { render json: @contacts }
      format.js
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end


  def favorite
    @contacts = @user.contacts.favorite.page(params[:page]).per_page(12)
                                .reorder("#{sort_column} #{sort_direction}")
                                .search(params[:search])
    render action: :index
  end

  def friend
    @contacts = @user.contacts.friend.page(params[:page]).per_page(12)
                              .reorder("#{sort_column} #{sort_direction}")
                              .search(params[:search])
    render action: :index
  end

  def family
    @contacts = @user.contacts.family.page(params[:page]).per_page(12)
                              .reorder("#{sort_column} #{sort_direction}")
                              .search(params[:search])
    render action: :index
  end

  def colleague
    @contacts = @user.contacts.colleague.page(params[:page]).per_page(12)
                                .reorder("#{sort_column} #{sort_direction}")
                                .search(params[:search])
    render action: :index
  end

  # GET /contacts/new
  def new
    @contact = @user.contacts.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = @user.contacts.build(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to root_path, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def import_contacts
    @contacts = request.env["omnicontacts.contacts"]
    @user.import_contacts(@contacts)

    redirect_to root_path
  end

  private

    def load_user
      @user = current_user || User.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      load_user
      @contact = @user.contacts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone_number,
                                      :company, :user_id, :avatar, :favorite, :family,
                                      :friend, :colleague)
    end

    ## Sanitized params for sorting
    def sort_column
      Contact.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
    end

    def sort_direction
      %w(asc desc).include?(params[:direction]) ? params[:direction] : "asc"
    end
 end
