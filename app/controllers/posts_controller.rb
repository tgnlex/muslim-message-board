class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.all.order("created_at DESC")
    end 
    
    def show
      @post = Post.find(params[:id])
    end
    
    def new 
     @post = current_user.posts.build
    end 

    def create
       @post = current_user.posts.build(post_params)
      if @post.save
        flash[:notice] = "Post was successfully created." 
        redirect_to @post
      else 
        render 'new'
      end
    end
    # ############################### #
    # ######### ADMIN ONLY ########## #
    # # Functions intended only for # #
    # # users with admin privelages # # 
    # ######### ADMIN ONLY ########## #
    # ############################### #
    def edit

    end 

    def update
      if @post.update(post_params)
        redirect_to post_path
      else 
        render 'edit'
      end
    end 

    def destroy
        @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
    end
    # ############################### #
    # ##### ADMIN FUNCTIONS END ##### #
    # ############################### #
    private 

      def post_params
        params.require(:post).permit(:title, :description)
      end

      def find_post
        @post = Post.find(params[:id])
      end
end
