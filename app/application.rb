class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
    
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
