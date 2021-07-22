class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
    
      
    elsif req.path.match(/users/) && req.post?
      # code to unpackage the stringified JSON
      data = JSON.parse(req.body.read)
      # check if user exists with the username # usernames must be unique
      userExists = User.find_by(username: data["username"])
      # if user exists, send error message letting them know user exists
      if userExists
        return [200, { 'Content-Type' => 'application/json' }, [ {:error => "User with username: #{userExists.username}, already exists."}.to_json ]]
      else
        # if user does not exist, create and save a new user
        user = User.create(data)
        # what do I want to send back in response?
        return [200, { 'Content-Type' => 'application/json' }, [ {:message => {:message => "You have successfully signed up for Guardian Inventory Manager!", :user => user}.to_json}]]
      end
      
    elsif req.path.match(/users/) 
        return [200, { 'Content-Type' => 'application/json' }, [ {data: User.all}.to_json ]]
    
    elsif req.path.match(/guardians/)
      return [200, { 'Content-Type' => 'application/json' }, [ {data: Guardian.all}.to_json ]]
    
    elsif req.path.match(/items/)
      return [200, { 'Content-Type' => 'application/json' }, [ {data: Item.all}.to_json ]]
    
    else
      resp.write "Path Not Found"
    end
    resp.finish
  end
end
