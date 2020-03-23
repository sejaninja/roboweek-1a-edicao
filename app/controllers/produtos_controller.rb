class ProdutosController < ApplicationController
  before_action :set_produto, only: %i[show edit update destroy]

  helper ProdutosHelper

  # GET /produtos
  def index
    # @produtos = Produto.all
    @nome_a_buscar = params[:nome]
    @produtos = Produto.where 'nome like ?', "%#{@nome_a_buscar}%"
  end

  # GET /produtos/1
  def show; end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit; end

  # POST /produtos
  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      flash[:notice] = 'Produto cadastrado com sucesso.'
      redirect_to root_url
    else
      render :new
    end
  end

  # PATCH/PUT /produtos/1
  def update
    if @produto.update(produto_params)
      flash[:notice] = 'Produto atualizado com sucesso.'
      redirect_to root_url
    else
      render :edit
    end
  end

  # DELETE /produtos/1
  def destroy
    @produto.destroy
    flash[:notice] = 'Produto removido com sucesso.'
    redirect_to produtos_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_produto
    @produto = Produto.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def produto_params
    params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
  end
end
