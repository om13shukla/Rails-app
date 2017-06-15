class ArticlesController < ApplicationController
    def new
    @article = Article.new     
  end
    
    def create
    #render plain: params[:article].inspect
    @article = Article.new(params.require(:article).permit(:title, :text))
 
    if @article.save
        redirect_to @article
    else 
        render 'new'
    end    
  end
    
    def show
    @article = Article.find(params[:id])
  end
    
     def index
    @articles = Article.all
   end
    
    def edit
  @article = Article.find(params[:id])
end
    
    def update
  @article = Article.find(params[:id])
 
  if @article.update(params.require(:article).permit(:title, :text))
    redirect_to @article
  else
    render 'edit'
  end
end
    
    def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end
    


end
