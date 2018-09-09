class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
        @articles = Article.all
    end
    
    def new
       @article = Article.new
    end
    
    def edit 
    end

    def create
        #debugger
        @article = Article.new(article_params)
         @article.user = User.first
        if @article.save
            flash[:sucess] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def update
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def show
    end
    
    def destroy
       if @article.destroy
            flash[:danger] = "Article was successfully deleted"
            redirect_to articles_path
       else
           render_to articles_path
       end
    end
    
    private def article_params
           params.require(:article).permit(:title, :description) 
        end
        
        def set_article
            @article = Article.find(params[:id])
        end
        

end