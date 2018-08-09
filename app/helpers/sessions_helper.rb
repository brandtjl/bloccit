module SessionsHelper
    def create_session(user)
        session[:user_id] = user.id
      end
    
    # #5
      def destroy_session(user)
        session[:user_id] = nil
      end
    #why create these helper methods instead of just adding that one line of code inside the action methods in the controller?

    # #6
      def current_user
        User.find_by(id: session[:user_id])
      end
  
end
