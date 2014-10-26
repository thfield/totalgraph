if current_user?(@user)
  

  json.array! @user.weights, :date, :total, :pfat, :fat, :lean
	

end

