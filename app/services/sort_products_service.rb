class SortProductsService
  def initialize(params, collection, per_page)
    @params = params
    @collection = collection
    @per_page = per_page
  end

  def call
    @products = @collection.order(price: :asc) if @params[:filter] == 'LowPrice'
    @products = @collection.order(price: :desc) if @params[:filter] == 'HighPrice'
    @products = @collection.order(name: :asc) if @params[:filter] == 'Alphabetical'
    if @params[:min].present? || @params[:max].present?
      @products = @collection.where(price: [@params[:min].to_i].first..[@params[:max].to_i].last)
    end
    @products = @products.presence || @collection.order(created_at: :desc)
    @products.paginate(page: @params[:page], per_page: @per_page)
  end
end
