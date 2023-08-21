class Admin::DashboardController < ApplicationController
	def index
	  @posts = Post.order(created_at: :desc)
	  @projects = Project.order(created_at: :desc)
	  @users = User.order(created_at: :desc)
	  @admins = User.where(admin: true)
	  @post_counts = Post.group(:created_at).count

	end

	def statistics
		@data = {
			yearly_user_signups: yearly_user_signups,
			monthly_user_signups: monthly_user_signups,
			weekly_user_signups: weekly_user_signups,

			yearly_post_counts: yearly_post_counts,
			monthly_post_counts: monthly_post_counts,
			weekly_post_counts: weekly_post_counts,

			yearly_post_views: yearly_post_views,
			monthly_post_views: monthly_post_views,
			weekly_post_views: weekly_post_views,
		}

		render json: @data
	end
  
	def yearly_user_signups
	  @yearly_signups = User
		.select("DATE_FORMAT(users.created_at, '%Y') AS year")
		.select('COUNT(users.id) AS signups')
		.group('year')
		.as_json(except: :id)
	#   render json: @yearly_signups
	end
  
	def monthly_user_signups
	  @monthly_signups = User
		.select("DATE_FORMAT(users.created_at, '%Y-%m') AS month")
		.select('COUNT(users.id) AS signups')
		.group('month')
		.as_json(except: :id)
	#   render json: @monthly_signups
	end
  
	def weekly_user_signups
	  @weekly_signups = User
		.select("DATE_FORMAT(users.created_at, '%Y-%m-%d') AS week")
		.select('COUNT(users.id) AS signups')
		.group('week')
		.as_json(except: :id)
	#   render json: @weekly_signups
	end
	
	def yearly_post_counts
		@yearly_counts = Post
		  .select("DATE_FORMAT(posts.created_at, '%Y') AS year")
		  .select('COUNT(posts.id) AS post_count')
		  .group('year')
		  .as_json(except: :id)  # Exclude the 'id' column from the JSON response
		# render json: @yearly_counts
	end
	
	def monthly_post_counts
		@monthly_counts = Post
		  .select("DATE_FORMAT(posts.created_at, '%Y-%m') AS month")
		  .select('COUNT(posts.id) AS post_count')
		  .group('month')
		  .as_json(except: :id)  # Exclude the 'id' column from the JSON response
		# render json: @monthly_counts
	end
	
	def weekly_post_counts
		@weekly_counts = Post
		  .select("DATE_FORMAT(posts.created_at, '%Y-%m-%d') AS week")
		  .select('COUNT(posts.id) AS post_count')
		  .group('week')
		  .as_json(except: :id)  # Exclude the 'id' column from the JSON response
		# render json: @weekly_counts
	end

	def total_posts_views
		@total_views = Post.sum(:views)
		render json: { total_views: @total_views }
	end
	
	def yearly_post_views
		@yearly_views = Post
		  .select("DATE_FORMAT(posts.created_at, '%Y') AS year")
		  .select('SUM(posts.views) AS views')
		  .group('year')
		  .as_json(except: :id)  # Exclude the 'id' column from the JSON response
		# render json: @yearly_views
	end
	
	def monthly_post_views
		@monthly_views = Post
		  .select("DATE_FORMAT(posts.created_at, '%Y-%m') AS month")
		  .select('SUM(posts.views) AS views')
		  .group('month')
		  .as_json(except: :id)  # Exclude the 'id' column from the JSON response
		# render json: @monthly_views
	end
	
	def weekly_post_views
		@weekly_views = Post
		  .select("DATE_FORMAT(posts.created_at, '%Y-%m-%d') AS week")
		  .select('SUM(posts.views) AS views')
		  .group('week')
		  .as_json(except: :id)  # Exclude the 'id' column from the JSON response
		# render json: @weekly_views
	end
end
  