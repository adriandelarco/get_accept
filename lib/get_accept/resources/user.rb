module GetAccept
  class User < Resource
    def me
      get('/users/me')
    end

    def all
      get('/users')
    end

    def find id
      get("/users/#{id}")
    end

    def statistics_for id
      get("/users/#{id}/statistics")
    end

    def create data
      post('/users', data)
    end
  end
end
