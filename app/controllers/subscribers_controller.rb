class SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
  end

  def new
    @subscriber = Subscriber.new(params[:subscriber])
  end

  def edit
    @subscriber = Subscriber.find(params[:id])
  end

  def show
    @subscriber = Subscriber.find(params[:id])
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if !@subscriber.idNumber.include? '-'
      @subscriber.idNumber = @subscriber.idNumber.insert(2, '-').insert(7, '-')
    end
    if @subscriber.valid?
      @subscriber.course = @subscriber.course.upcase
      @subscriber.firstName = @subscriber.firstName.titleize
      @subscriber.lastName = @subscriber.lastName.titleize
    end
    if @subscriber.save
      flash[:success] = "Subscriber successfully registered!"
      redirect_to subscribers_path
    else
      flash[:danger] = @subscriber.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to subscribers_path
  end

  def update
    @subscriber = Subscriber.find(params[:id])
    if @subscriber.update(subscriber_params)
      flash[:success] = "Subscriber information successfully updated!"
      redirect_to subscribers_path
    else
      render 'edit'
    end
  end

  private
    def subscriber_params
      params.require(:subscriber).permit(:firstName, :idNumber, :lastName, :email, :controlNumber, :college, :contactNumber, :course)
    end


end
